from pydantic import BaseModel
from typing_extensions import Optional


class DataForTask(BaseModel):
    """Схема для создания задачи в бд"""
    title: str
    description: Optional[str] = None
    employ_id: str


class GetTasks(BaseModel):
    """Вывод списка задач"""
    id: int
    title: str
    description: str
    status: bool
    employee_assigned_to_task: Optional[str] = None
