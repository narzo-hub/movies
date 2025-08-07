FROM python:3.10.8-slim-buster

RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list
RUN sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list

RUN apt update && apt install git -y

WORKDIR /movies

COPY requirements.txt .

RUN pip3 install -U pip && pip3 install -U -r requirements.txt

COPY . .

CMD ["python", "bot.py"]
