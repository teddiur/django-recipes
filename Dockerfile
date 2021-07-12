FROM python:3.7-alpine
MAINTAINER teddiur_

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN export UID=${UID} && export GID=${GID}

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user