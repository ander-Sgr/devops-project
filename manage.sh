#!/bin/bash
# Requires the database to be up
FLASK_ENV=development DATABASE_URI=postgresql://dev_user:envdev@db_postgres:5432/local_dev_db python manage.py
