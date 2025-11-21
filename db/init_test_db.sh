#!/bin/bash
set -e

# Дропаем тестовую базу, если есть
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    DROP DATABASE IF EXISTS vector_db_test;
EOSQL

# Создаем тестовую базу
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE vector_db_test;
EOSQL

# Подключаем расширение vector в тестовой базе
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d vector_db_test <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS vector;
EOSQL

# Копируем данные из основной базы в тестовую
pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" | psql -U "$POSTGRES_USER" -d vector_db_test
