from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import select, update

from bad_responses import ErrorOrSucess
from config import STATIC_ACCESS_KEY
from database import get_async_session
from auth.models import user
from auth.base_config import fastapi_users
from sqlalchemy.ext.asyncio import AsyncSession

from profile.schemas import GetUserProfile, UpdateUserProfileInfo

current_user = fastapi_users.current_user()
# создаём новый роутер
profile_router = APIRouter(
    prefix='/profile',
    tags=['Profile']
)


@profile_router.get('/get_profile/{need_user_id}',
                    responses={401: {'model': ErrorOrSucess, 'description': 'Unauthorized'},
                               400: {'model': ErrorOrSucess, 'description': "User doesn't exist"}},
                    response_model=GetUserProfile)
async def get_user_profile(need_user_id: int, person: user = Depends(current_user),
                           session: AsyncSession = Depends(get_async_session)) -> dict:
    """Получение информации из профиля пользователя по id"""

    # проверка на то что id пользователя неотрицательный
    if need_user_id < 0:
        raise HTTPException(status_code=400, detail="User doesn't exist")
    # делаем запрос к бд
    query = select(user).where(user.id == need_user_id)
    sqlalchemy_engine = await session.execute(query)
    data = sqlalchemy_engine.fetchall()
    # смотрим что пользователь есть в бд
    if len(data) > 0:
        # забираем все интересующие нас данные
        user_obj = data[0][0]
        ans = dict()
        ans['last_name'] = user_obj.last_name
        ans['first_name'] = user_obj.first_name
        ans['patronymic'] = user_obj.patronymic
        ans['username'] = user_obj.username
        ans['email'] = user_obj.email
        ans['desc'] = user_obj.description
        ans['birthday'] = user_obj.birthday
        ans['position'] = user_obj.position
        ans['experience_in_company'] = user_obj.experience_in_company
        ans['phone_number'] = user_obj.phone_number
        ans['about_me'] = user_obj.about_me
        ans['work_place'] = user_obj.work_place
        return ans
    raise HTTPException(status_code=400, detail="User doesn't exist")


@profile_router.post('/change_profile_info',
                     responses={200: {'model': ErrorOrSucess, 'description': 'OK'},
                                401: {'model': ErrorOrSucess, 'description': "User doesn't exist"}})
async def post_user_profile(user_data: UpdateUserProfileInfo,
                            person: user = Depends(current_user), session: AsyncSession = Depends(get_async_session)):
    """Изменение информации в профиле пользователя"""
    data_in_dict_format = dict(user_data)
    stmt = update(user).where(user.id == person.id).values(**data_in_dict_format)
    await session.execute(stmt)
    await session.commit()
    raise HTTPException(status_code=200, detail='OK')


@profile_router.put('/become_manager', responses={200: {'model': ErrorOrSucess, 'description': 'OK'},
                                                  401: {'model': ErrorOrSucess, 'description': "User doesn't exist"},
                                                  400: {'model': ErrorOrSucess, 'description': "Already admin"}})
async def expand_rights(access_key: str, person: user = Depends(current_user),
                        session: AsyncSession = Depends(get_async_session)):
    """Расширить права став администратором (менеджером)"""
    query = select(user).where(user.id == person.id)
    stmt = update(user).where(user.id == person.id).values(is_superuser=True)
    # выдача прав на суперпользователя только в том случае если пользователь ввёл правильный ключ
    if access_key == STATIC_ACCESS_KEY:
        data_sup_user = await session.execute(query)
        # проверяем что пользователь ещё не менеджер
        if not data_sup_user.fetchall()[0][0].is_superuser:
            await session.execute(stmt)
            await session.commit()
            return {'detail': 'you get more rights access'}
        else:
            raise HTTPException(status_code=400, detail="you are already an admin, re-granting rights is not possible")
    else:
        raise HTTPException(status_code=400, detail="don't correct access key")
