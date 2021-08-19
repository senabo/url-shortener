# pull official base image
FROM python:3.8.10-alpine

# set work directory
WORKDIR /project

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update
RUN apk add postgresql-dev gcc python3-dev musl-dev

# install dependencies
#RUN pip install --upgrade pip
COPY ./requirements.txt /project/requirements.txt
RUN pip install -r requirements.txt

# copy project
COPY . /project