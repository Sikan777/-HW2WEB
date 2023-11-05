FROM python:3.11-slim

RUN apt-get update && apt-get install -y libtk8.6 x11-apps xvfb

ENV DISPLAY=:99

RUN pip install poetry

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY pyproject.toml poetry.lock ./
COPY . .

RUN poetry config virtualenvs.create false && poetry install --no-dev

RUN rm -f /tmp/.X99-lock

CMD Xvfb :99 -ac -screen 0 1024x768x16 & poetry run python /media/user/1DE10D7337BB2DD7/Team-Project-GOITv1.0/main.py
