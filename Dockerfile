FROM python:3.7

MAINTAINER Kathirraj

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update  && apt-get -y install gcc make  && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade pip

WORKDIR /src/app

COPY ./requirements.txt /src/app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

WORKDIR /src/app/ML_Model
RUN python model.py

WORKDIR /src/app
EXPOSE 8080
ENTRYPOINT [ "python" ] 
CMD [ "app.py","run","--host","0.0.0.0"] 
