from typing import Optional, Union

from fastapi import Depends, Request
from fastapi_users import BaseUserManager, IntegerIDMixin, InvalidPasswordException

from auth.models import user
from auth.utils import get_user_db, is_valid_password, is_valid_email
from auth.schemas import UserCreate
from config import SECRET_USER_MANAGER

SECRET = SECRET_USER_MANAGER


class InvalidEmailException(Exception):
    """Самописная ошибка для некорректной почты"""
    ...


class UserManager(IntegerIDMixin, BaseUserManager[user, int]):
    """Class for user management"""
    reset_password_token_secret = SECRET
    verification_token_secret = SECRET

    async def on_after_register(self, person: user, request: Optional[Request] = None):
        """Логирование (user.id) зарегистрировался в системе"""
        print(f"User {person.id} has registered.")

    async def validate_password(
            self,
            password: str,
            person: Union[UserCreate, user],
    ) -> None:
        """Метод для валидации пароля при регистрации в системе"""
        if len(password) < 8 or len(password) > 40:
            raise InvalidPasswordException(
                reason="Password should be at least 8 characters and less then 40 char"
            )
        if not is_valid_password(password):
            raise InvalidPasswordException(
                reason="Invalid characters in the password"
            )
        if person.email in password:
            raise InvalidPasswordException(
                reason="Password should not contain e-mail"
            )
        # проверка почты на существование
        if not is_valid_email(person.email):
            raise InvalidPasswordException(
                reason="Incorrect email format"
            )


async def get_user_manager(user_db=Depends(get_user_db)):
    yield UserManager(user_db)
