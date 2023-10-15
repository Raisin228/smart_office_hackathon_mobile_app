from pydantic import BaseModel, Field, constr


class CreateAnonimWish(BaseModel):
    """Валидация полей при создании анонимного пожелания"""
    topic: str = Field(min_length=5, max_length=50)
    main_text: constr(min_length=1, max_length=1000) = None


class GetListWishes(CreateAnonimWish):
    """Для get_wishes"""
    id: int
