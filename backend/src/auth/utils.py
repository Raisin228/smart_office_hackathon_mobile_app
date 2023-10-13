from datetime import datetime

import phonenumbers
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


def is_valid_birth(value: str) -> bool:
    """Валидация дня рождения"""
    try:
        birthday = datetime.strptime(value, '%Y-%m-%d')
        today = datetime.today()
        age = today.year - birthday.year - ((today.month, today.day) < (birthday.month, birthday.day))
        if age < 0 or age > 120:
            raise ValueError('Invalid birthday')
    except ValueError:
        return False
    return True


def is_valid_phone(v: str) -> bool:
    """Валидация номера телефона"""
    try:
        parsed_number = phonenumbers.parse(v, None)
        if (not phonenumbers.is_valid_number(parsed_number) or
                any(map(lambda ch: ch.lower() in ascii_lowercase, v))):
            return False
    except phonenumbers.phonenumberutil.NumberParseException:
        return False
    return True




