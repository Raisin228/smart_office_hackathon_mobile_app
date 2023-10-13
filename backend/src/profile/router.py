from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import select, update

from bad_responses import ErrorOrSucess
from database import get_async_session
from auth.models import user
from auth.base_config import fastapi_users
from sqlalchemy.ext.asyncio import AsyncSession

from profile.schemas import GetUserProfile, GetUserProfileInfo

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
        return ans
    raise HTTPException(status_code=400, detail="User doesn't exist")


@profile_router.post('/change_profile_info',
                     responses={200: {'model': ErrorOrSucess, 'description': 'OK'},
                                401: {'model': ErrorOrSucess, 'description': "User doesn't exist"}})
async def post_user_profile(user_data: GetUserProfileInfo,
                            person: user = Depends(current_user), session: AsyncSession = Depends(get_async_session)):
    """Изменение информации в профиле пользователя"""
    data_in_dict_format = dict(user_data)
    stmt = update(user).where(user.id == person.id).values(**data_in_dict_format)
    await session.execute(stmt)
    await session.commit()
    raise HTTPException(status_code=200, detail='OK')
