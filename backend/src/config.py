from dotenv import load_dotenv
import os

load_dotenv()

DB_USER = os.environ.get('DB_USER')
DB_PASS = os.environ.get('DB_PASS')
DB_HOST = os.environ.get('DB_HOST')
DB_PORT = os.environ.get('DB_PORT')
DB_NAME = os.environ.get('DB_NAME')

MY_JWT_SECRET = os.environ.get('JWT_SECRET')
SECRET_USER_MANAGER = os.environ.get('SECRET_USER_MANAGER')
STATIC_ACCESS_KEY = os.environ.get('STATIC_ACCESS_KEY')
