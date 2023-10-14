from pydantic import BaseModel, EmailStr, validator, Field
from typing_extensions import Optional

from auth.utils import is_valid_birth, is_valid_phone


class GetUserProfile(BaseModel):
    """Класс для валидации данных из профиля пользователя"""
    last_name: str
    first_name: str
    patronymic: str
    username: str
    email: str = EmailStr
    desc: Optional[str] = None
    birthday: Optional[str] = None
    position: Optional[str] = None
    experience_in_company: Optional[int] = None
    phone_number: Optional[str] = None
    about_me: Optional[str] = None
    work_place: Optional[str] = None


class UpdateUserProfileInfo(BaseModel):
    """Валидация данных запросе на изменение profile"""
    description: str

    @validator('description')
    def validate_desc(cls, v):
        if v not in ['на больничном', 'в отпуске', 'работает']:
            raise ValueError('desc must be either (на больничном) or (в отпуске) or (работает)')
        return v

    birthday: str

    @validator('birthday')
    def validate_birt(cls, v):
        if not is_valid_birth(v):
            raise ValueError('The wrong date of birth should be in the format 2004-10-29')
        return v

    position: str = Field(min_length=2)
    experience_in_company: int = Field(ge=0)

    phone_number: str

    @validator('phone_number')
    def validate_phone(cls, v):
        if not is_valid_phone(v):
            raise ValueError('Incorrect phone number format. The phone must be in the format +7807411677')
        return v

    about_me: str = Field(max_length=1000)
    work_place: str = Field(max_length=1000)
