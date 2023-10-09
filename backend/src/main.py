import uvicorn
from fastapi import FastAPI
from auth.base_config import auth_backend, fastapi_users
from auth.schemas import UserRead, UserCreate

# создание backend
app = FastAPI(
    title='Smart Office',
    version='1.0'
)

# (роутер) login/logout
app.include_router(
    fastapi_users.get_auth_router(auth_backend),
    prefix="/auth",
    tags=["Auth"],
)

# (роутер) регистрации
app.include_router(
    fastapi_users.get_register_router(UserRead, UserCreate),
    prefix="/auth",
    tags=["Auth"],
)


if __name__ == '__main__':
    uvicorn.run('main:app', port=8001)
