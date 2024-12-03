#!/bin/bash
# Requires the database to be up
BASE_URL="postgresql://dev_user:envdev@db_postgres:5432"

if [ "$FLASK_ENV" = "development" ]; then
    DATABASE_URI="${BASE_URL}/local_dev_db"
fi

python manage.py
