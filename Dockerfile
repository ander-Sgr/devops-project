FROM python:3.10-slim

WORKDIR /app

#avoid gen filpes pyc and output stdout stdrr
ENV PYTHONDONTWRITEBYTECODE=1  \
    PYTHONUNBUFFERED=1

# install dependencies system
RUN apt-get update && apt-get install -y netcat-traditional \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install dependencies
COPY ./requirements.txt /app ./requirements-test.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt -r requirements-test.txt

COPY . /app/

RUN chmod +x /app/entrypoint.sh

#run entrypoint
ENTRYPOINT [ "./entrypoint.sh" ]