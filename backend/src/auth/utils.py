from fastapi import Depends
from fastapi_users_db_sqlalchemy import SQLAlchemyUserDatabase
from sqlalchemy.ext.asyncio import AsyncSession
from string import ascii_lowercase
from email_validator import validate_email

from auth.models import user
from database import get_async_session

SPEC_SYMBOLS = "!@#$%&*()-_+=;:,./?|`~[]{}^'<>~"
NUMBERS = '0123456789'


async def get_user_db(session: AsyncSession = Depends(get_async_session)):
    yield SQLAlchemyUserDatabase(session, user)


def is_valid_password(password):
    """Проверяем пароль на допустимые символы"""
    for ch in password:
        new_ch = ch.lower()
        if new_ch not in ascii_lowercase and new_ch not in SPEC_SYMBOLS and new_ch not in NUMBERS:
            return False
    return True


def is_valid_email(email: str) -> bool:
    """Валидация почты"""
    try:
        if validate_email(email):
            return True
    except:
        return False

