FROM python:3.10-slim

WORKDIR /app

#avoid gen filpes pyc and output stdout stdrr
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# install dependencies system
RUN apt-get update && apt-get install -y netcat-traditional

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /app
RUN pip install -r requirements.txt

COPY . /app/

RUN chmod +x /app/entrypoint.sh

#run entrypoint
ENTRYPOINT [ "./entrypoint.sh" ]