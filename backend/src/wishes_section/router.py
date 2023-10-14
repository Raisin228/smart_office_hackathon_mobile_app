from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import insert, select, delete
from typing_extensions import List

from bad_responses import ErrorOrSucess
from database import get_async_session
from auth.models import user
from auth.base_config import fastapi_users
from sqlalchemy.ext.asyncio import AsyncSession

from wishes_section.models import wishes
from wishes_section.schemas import CreateAnonimWish, GetListWishes

# обычный авторизованный пользователь
current_user = fastapi_users.current_user()
# суперпользователь
current_superuser = fastapi_users.current_user(active=True, superuser=True)
# создаём новый роутер
wishes_router = APIRouter(
    prefix='/wishes',
    tags=['Wishes']
)


@wishes_router.get('/get_list_wishes', responses={401: {'model': ErrorOrSucess, 'description': 'Unauthorized'},
                                                  403: {'model': ErrorOrSucess, 'description': 'No access rights'}},
                   response_model=List[GetListWishes])
async def get_all_wishes(person: user = Depends(current_superuser), session: AsyncSession = Depends(get_async_session)):
    """Эндпоинт для получения списка всех пожеланий"""
    query = select(wishes)
    data = await session.execute(query)
    names_columns = list(data.keys())
    result = [dict(zip(names_columns, row)) for row in data.fetchall()]
    return result


@wishes_router.post('/send_anonim_wish', responses={401: {'model': ErrorOrSucess, 'description': 'Unauthorized'},
                                                    200: {'model': ErrorOrSucess, 'description': 'OK'}})
async def send_wish(data: CreateAnonimWish, person: user = Depends(current_user),
                    session: AsyncSession = Depends(get_async_session)):
    """Создание и отправка пожелания менеджеру"""
    data_in_dict = dict(data)
    stmt = insert(wishes).values(**data_in_dict)
    await session.execute(stmt)
    await session.commit()
    return {'status': 200}


@wishes_router.delete('/delete_select_post/{p_id}',
                      responses={401: {'model': ErrorOrSucess, 'description': 'Unauthorized'},
                                 200: {'model': ErrorOrSucess, 'description': 'OK'},
                                 404: {'model': ErrorOrSucess, 'description': 'Not found'}})
async def delete_selected_post(p_id: int, person: user = Depends(current_superuser),
                               session: AsyncSession = Depends(get_async_session)):
    """Эндпоинт доступный только менеджерам удаляет желания из списка (если задача решена)"""
    if p_id <= 0:
        raise HTTPException(status_code=404, detail='Not found')

    query = select(wishes).where(wishes.c.id == p_id)
    engine = await session.execute(query)
    if len(engine.fetchall()):
        stmt = delete(wishes).where(wishes.c.id == p_id)
        await session.execute(stmt)
        await session.commit()
    else:
        raise HTTPException(status_code=404, detail='Not found')
