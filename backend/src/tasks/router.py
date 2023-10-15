from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import insert, select, delete, and_
from typing_extensions import List

from bad_responses import ErrorOrSucess
from database import get_async_session
from auth.models import user
from auth.base_config import fastapi_users
from sqlalchemy.ext.asyncio import AsyncSession

from tasks.models import tasks
from tasks.schemas import DataForTask, GetTasks
from wishes_section.models import wishes
from wishes_section.schemas import CreateAnonimWish, GetListWishes

# обычный авторизованный пользователь
current_user = fastapi_users.current_user()
# суперпользователь
current_superuser = fastapi_users.current_user(active=True, superuser=True)
# создаём новый роутер
tasks_router = APIRouter(
    prefix='/tasks',
    tags=['Duties']
)


@tasks_router.get('/get_tasks', responses={200: {'model': ErrorOrSucess, 'description': 'OK'},
                                           401: {'model': ErrorOrSucess, 'description': 'Unauthorized'}},
                  response_model=List[GetTasks])
async def get_list_tasks(person: user = Depends(current_user),
                         session: AsyncSession = Depends(get_async_session)):
    """Получить список задач"""
    # определяем кто отправил запрос на получение информации о списке задач
    rights = person.is_superuser
    # если админ
    if rights:
        # забрали все задачи
        query = select(tasks)
        tasks_data = await session.execute(query)
        data = tasks_data.fetchall()
        # преобразовываем полученные данные к нормальному виду вместо id фио
        res = []
        for i in range(len(data)):
            # получаем имя фамилию и отчество из бд по id
            query = select(user).where(user.id == data[i][4])
            clean_d = await session.execute(query)
            buf = clean_d.fetchall()[0][0]
            last_name = buf.last_name
            name = buf.first_name
            patronymic = buf.patronymic
            # составили фио и положили нормальные данные в res
            fio = f'{last_name} {name} {patronymic}'
            t = list(data[i][:4])
            t.append(fio)
            res.append(t)
        names_columns = list(tasks_data.keys())
        # приводим данные ответа в формат описаный в ResponseGetNews
        result = [dict(zip(names_columns, row)) for row in res]
        return result
    else:
        query = select(tasks).where(tasks.c.employee_assigned_to_task == person.id)
        d = await session.execute(query)
        clean_d = d.fetchall()
        names_columns = list(d.keys())
        # приводим данные ответа в формат описаный в ResponseGetNews
        l_n = person.last_name
        n = person.first_name
        p = person.patronymic
        fio = f'{l_n} {n} {p}'
        res = []
        for row in clean_d:
            row = list(row[:4])
            row.append(fio)
            res.append(row)
        result = [dict(zip(names_columns, row)) for row in res]
        return result


@tasks_router.post('/make_new_task', responses={200: {'model': ErrorOrSucess, 'description': 'OK'},
                                                401: {'model': ErrorOrSucess, 'description': 'Unauthorized'},
                                                403: {'model': ErrorOrSucess, 'description': 'No access'},
                                                404: {'model': ErrorOrSucess, 'description': "Not found"},
                                                })
async def create_new_assignment(data: DataForTask, person: user = Depends(current_superuser),
                                session: AsyncSession = Depends(get_async_session)) -> dict:
    """ЭП для создания новых поручений (доступ только для менеджеров)"""
    user_fio = data.employ_id.split()
    # если у пользователя некорректно заданы фио
    if len(user_fio) != 3:
        raise HTTPException(status_code=404, detail='Not found')
    # забрали фио
    last_name = user_fio[0]
    name = user_fio[1]
    patron = user_fio[2]
    # ищем пользователя по фио в бд
    query = select(user).where((user.last_name == last_name) & (user.first_name == name) & (user.patronymic == patron))
    user_d = await session.execute(query)
    # проверяем найден ли пользователь с таким фио
    comp = user_d.fetchall()
    if not len(comp):
        raise HTTPException(status_code=404, detail='Not found')
    # если да то забираем его id из db
    user_id = comp[0][0].id
    # создаём задачу на этого пользователя
    stmt = insert(tasks).values(title=data.title, description=data.description, employee_assigned_to_task=user_id)
    await session.execute(stmt)
    await session.commit()
    return {'detail': 'task issued'}


@tasks_router.delete('/delete_duties/{task_id}', responses={200: {'model': ErrorOrSucess, 'description': 'OK'},
                                                            401: {'model': ErrorOrSucess,
                                                                  'description': 'Unauthorized'},
                                                            403: {'model': ErrorOrSucess, 'description': 'No access'},
                                                            404: {'model': ErrorOrSucess, 'description': "Not found"},
                                                            })
async def delete_user_task(task_id: int, person: user = Depends(current_superuser),
                           session: AsyncSession = Depends(get_async_session)) -> dict:
    """ЭП для удаления задач (доступ только у менеджеров)"""
    # самая глупая защита от дурака
    if task_id <= 0:
        raise HTTPException(status_code=404, detail='Not found')
    # проверка на то что такая задача с таким id есть в бд
    query = select(tasks).where(tasks.c.id == task_id)
    data = await session.execute(query)
    comp = data.fetchall()
    if not len(comp):
        raise HTTPException(status_code=404, detail='Not found')
    # если всё успешно тогда удаляем задачу
    stmt = delete(tasks).where(tasks.c.id == task_id)
    await session.execute(stmt)
    await session.commit()
    return {'detail': 'task success delete'}
