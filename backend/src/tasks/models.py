from sqlalchemy import String, Column, Integer, Boolean, MetaData, Table, ForeignKey
from sqlalchemy.orm import declarative_base

from auth.models import user

metadata = MetaData()
Base = declarative_base(metadata=metadata)

# table tasks in db
tasks = Table(
    'task',
    metadata,
    Column('id', Integer, primary_key=True, nullable=False),
    Column('title', String, nullable=False),
    Column('description', String, nullable=True),
    Column('status', Boolean, nullable=False, default=True),
    Column('employee_assigned_to_task', Integer, ForeignKey(user.id), nullable=False)
)
