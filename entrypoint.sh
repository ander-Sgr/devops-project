#!/bin/bash

# will check if the database is up after apply the config from manage.sh
if [ "$DATABASE" = "postgres" ]; then
    echo "Waiting for PostgreSQL to start..."
    while ! nc -z "$SQL_HOST" "$SQL_PORT"; do
        sleep 0.1
    done
    echo "PostgreSQL started"
fi

# execute the manage for up the DB
sh ./manage.sh

# give the control to the terminal
exec "$@"
