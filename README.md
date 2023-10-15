# <a href='https://github.com/Raisin228/smart_office_hackathon_mobile_app'>OfficeBoost</a>

---

## Описание

---

**OfficeBoost** - это уникальное мобильное приложение📱, разработанное нашей командой специалистов с одной целью -
***увеличить эффективность работы офисов*** и сделать рабочий процесс еще более продуктивным. Наши инновационные функции
помогают снизить нагрузку на сотрудников и оптимизировать рабочие процессы. **OfficeBoost** - это результат анализа 
успешных компаний, таких как Яндекс и ЛабМедиа. С нашим приложением вы сможете более эффективно ***управлять*** задачами, 
участвовать в улучшении рабочей среды и быстро решать все вопросы, связанные с работой.

## Краткое описание основного функционала

---

🚀 ***Управление задачами***: Менеджеры могут легко и быстро назначать задачи сотрудникам на определенное время. Это
способствует более эффективному планированию и выполнению задач, а также повышает координацию в офисе.

📢 ***Анонимный обмен мнениями***: Мы понимаем, что каждый сотрудник имеет свои уникальные идеи и предложения по улучшению
рабочей среды, поэтому мы создали анонимный раздел, где каждый может делиться своими пожеланиями и предложениями без
страха предвзятой критики.

👤 ***Личный кабинет***: Каждый пользователь имеет доступ к личному кабинету с краткой информацией о себе. Это помогает
сотрудникам лучше узнать друг друга и сотрудничать более продуктивно.

🆘 ***Помощь и поддержка***: В разделе "Помощь" вы можете быстро и удобно описать любую проблему, с которой вы столкнулись,
будь то технический сбой или запрос помощи специалиста. Это позволяет своевременно решать проблемы и избежать лишних
задержек.

## Запуск 

---
- Запуск mobile frontend
    * Клонируйте репозиторий себе на локальную машину `git clone ссылка на репозиторий`
    * Перейдите в директорию smart_office_hackaton_mobile_app/frontend/lib
    * Введите команду `flutter pub get`
    * Запустите файл main
    P.S для запуска требуется Android Studio с эмуляциями устройств
- Запуск backend
  * Клонируйте репозиторий себе на локальную машину `git clone ссылка на репозиторий`
  * Перейдите в smart_office_hackaton_mobile_app/backend/src 
  * Создайте виртуальное окружение `python -m venv venv`
  * Активируйте окружение `venv/Scripts/activate`
  * Установите все зависимости из requirements.txt `pip install -r requirements.txt`
  * Создайте файл .env следующего вида 
  ```
  DB_USER=postgres
  DB_PASS=postgres
  DB_HOST=localhost
  DB_PORT=5432
  DB_NAME=smart_office
  JWT_SECRET=i2qkj4YyNnfLheaEHciRzPxxBDHvcb26ym87UNE93U0Ri360KyNFCgzjTGQZg2o3yttYZec5dRgDjXikzix5oT4kwmNE1jUsnb6M
  SECRET_USER_MANAGER=3EvNG2CshQbOLqRRSV0V6wFmjVNDea
  STATIC_ACCESS_KEY=bigboss 
  ```
  * Создайте файл алембика `alembic init migrations` После чего создайте миграции `alembic migrations -autogenerate`
  Проведите миграцию `alembic upgrade 96c8d8482a4f`
  * Перейдите в src. Сделайте запуск локального сервера `uvicorn main:app --reload`
  * Можете локально тестировать работу backend
  * Скрестите пальцы и ждите чуда🤞🤞
    
  **P.S сервер backend развёрнут на хостинге вот ссылка чтобы его потыкать: https://fastapi-test-kegi.onrender.com/docs**

## Стек технологий

---

1. [Python3](https://www.python.org/) - язык программирования
2. [PostgreSQL](https://www.postgresql.org/) - система управления базами данных
3. [Docker](https://www.docker.com/) - по для автоматизации развёртывания и управления приложениями
4. [FastAPI](https://fastapi.tiangolo.com/) - асинхронный python backend framework
5. [Dart](https://dart.dev/) - язык программирования
6. [Flutter](https://flutter.dev/) - кроссплатформенный фреймворк языка Dart

## Команда

---

* ***Отдел организации и анализа продукта***
  - [Кириллова Ирина](https://vk.com/keislend) - маркетолог
  - [Скороходов Дмитрий](https://vk.com/dima_sk13) - product manager
* ***Отдел разработки***
  - [Атрошенко Богдан](https://vk.com/bog_at_04) - backend developer
  - [Сальников Кирилл](https://vk.com/k.salnikov2020) - mobile developer

## Архитектура решения

---

<img src="https://github.com/Raisin228/smart_office_hackathon_mobile_app/blob/main/images/archit.png">

## Скрин касты

---

<img src="https://github.com/Raisin228/smart_office_hackathon_mobile_app/blob/main/images/%D1%81%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F.jpg">
<img src="https://github.com/Raisin228/smart_office_hackathon_mobile_app/blob/main/images/%D0%B2%D1%85%D0%BE%D0%B4.jpg">
<img src="https://github.com/Raisin228/smart_office_hackathon_mobile_app/blob/main/images/%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8.jpg">
<img src="https://github.com/Raisin228/smart_office_hackathon_mobile_app/blob/main/images/%D0%B7%D0%B0%D1%8F%D0%B2%D0%BA%D0%B0.jpg">
<img src="https://github.com/Raisin228/smart_office_hackathon_mobile_app/blob/main/images/%D1%80%D0%B5%D0%B3%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F.jpg">
<img src="https://github.com/Raisin228/smart_office_hackathon_mobile_app/blob/main/images/%D1%81%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BF%D1%80%D0%B5%D0%B4%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F.jpg">
