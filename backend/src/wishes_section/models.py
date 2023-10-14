from sqlalchemy import String, Column, Integer, MetaData, Table
from sqlalchemy.orm import declarative_base

metadata = MetaData()
Base = declarative_base(metadata=metadata)

# table wishes in db
wishes = Table(
    'wishes',
    metadata,
    Column('id', Integer, primary_key=True, nullable=False),
    Column('topic', String, nullable=False),
    Column('main_text', String, nullable=True)
)
