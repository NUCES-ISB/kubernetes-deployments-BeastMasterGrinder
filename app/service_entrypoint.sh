#!/bin/bash

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  sleep 1
done
echo "PostgreSQL is ready"

# Run migrations
flask db upgrade

# Start Flask application
flask run --host=0.0.0.0 