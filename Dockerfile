FROM ubuntu:20.04

LABEL author="bensykes"
LABEL version="1.0.0"
LABEL pyversion="3.x"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libpq-dev python3-pip

WORKDIR /app
COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY mysite/ .

WORKDIR /app/
EXPOSE 8000
CMD [ "python3", "manage.py", "runserver" ]
