FROM python:3.6-alpine

MAINTAINER Robley Gori <ro6ley.github.io>

EXPOSE 8000

RUN apk add --no-cache gcc python3-dev musl-dev

ADD . /core

WORKDIR /core

RUN pip install -r requirements.txt

RUN python manage.py makemigrations

RUN python manage.py migrate

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]