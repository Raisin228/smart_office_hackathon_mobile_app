from datetime import datetime

from fastapi_users_db_sqlalchemy import SQLAlchemyBaseUserTable
from sqlalchemy import String, Boolean, Column, Integer, MetaData
from sqlalchemy.orm import declarative_base

# мета данные следят за разницей между моделью и таблицей в бд -> далее помогает делать ревизию и миграции
metadata = MetaData()
Base = declarative_base(metadata=metadata)


class user(SQLAlchemyBaseUserTable[int], Base):
    """user model in db"""
    # мои поля
    __tablename__ = 'user'

    id: int = Column(Integer, primary_key=True)
    last_name: str = Column(String, nullable=False)
    first_name: str = Column(String, nullable=False)
    patronymic: str = Column(String, nullable=False)
    username: str = Column(String, nullable=False, default='Anonymous')
    # необязательные поля для профиля
    description: str = Column(String(length=255), nullable=True)
    birthday: datetime = Column(String, nullable=True)
    position: str = Column(String(length=255), nullable=True)
    experience_in_company: int = Column(Integer, nullable=True)
    phone_number: str = Column(String, nullable=True)
    about_me: str = Column(String, nullable=True)
    work_place: str = Column(String, nullable=True)

    email: str = Column(String(length=320), unique=True, index=True, nullable=False)
    hashed_password: str = Column(String(length=1024), nullable=False)
    # default поля
    is_active: bool = Column(Boolean, default=True, nullable=False)
    is_superuser: bool = Column(Boolean, default=False, nullable=False)
    is_verified: bool = Column(Boolean, default=False, nullable=False)
