#!/bin/bash
SQL_HOST=db_postgres
SQL_PORT=5432
# will check if the database is up after apply the config from manage.sh

echo "Waiting for PostgreSQL to start..."
while ! nc -zv "$SQL_HOST" "$SQL_PORT"; do
    sleep 0.1
done
echo "PostgreSQL started"


# execute the manage for up the DB DEVELOPMENT
sh ./manage.sh

# give the control to the terminal
exec "$@"