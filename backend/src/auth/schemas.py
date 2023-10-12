from fastapi_users import schemas
from pydantic import Field, EmailStr, constr, validator
from typing_extensions import Optional


class UserRead(schemas.BaseUser[int]):
    """Данные отправляемые при чтении пользователя"""
    id: int
    username: str = Field(max_length=50)
    first_name: str = Field(max_length=50)
    last_name: str = Field(max_length=50)
    patronymic: str = Field(max_length=50)
    email: str = Field(max_length=60)
    is_active: bool = True
    is_superuser: bool = False
    is_verified: bool = False


class UserCreate(schemas.BaseUserCreate):
    """Схема для отправки данных после создания акк. В системе"""
    first_name: str = constr(strip_whitespace=True, max_length=40)
    last_name: str = constr(strip_whitespace=True, max_length=40)
    patronymic: str = constr(strip_whitespace=True, max_length=40)

    # срезаем все пробелы начало и конец и смотрим чтобы длина была мин 5 символов
    @validator('first_name', 'last_name', 'patronymic')
    def strip_and_check_length(cls, value):
        # Удаляем пробелы из начала и конца строки
        stripped_value = value.strip()

        # Проверяем, что длина строки больше 5
        if len(stripped_value) <= 5:
            raise ValueError("Поле 'first_name|last_name|patronymic' должны иметь длину не менее 5 символа")
        if len(stripped_value) >= 40:
            raise ValueError("Поле должно быть меньше 40 символов в длину")

        return stripped_value

    email: str = EmailStr
    password: str
    is_active: Optional[bool] = True
    is_superuser: Optional[bool] = False
    is_verified: Optional[bool] = False
