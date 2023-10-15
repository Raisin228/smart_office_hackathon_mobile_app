from pydantic import BaseModel


class ErrorOrSucess(BaseModel):
    """Для ошибок и успешных ответов(нужно чтобы регистр. в Responses)"""
    detail: str
