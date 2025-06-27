#!/bin/bash
set -e  # Hace que el script falle si hay un error

# Espera un poco si el contenedor se inicia demasiado rápido
sleep 5

# Aplica las migraciones de la base de datos
superset db upgrade

# Crea el usuario admin si no existe
superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@example.com \
    --password admin || true

# Inicializa Superset
superset init
superset run -h 0.0.0.0 -p 8088

# Finalmente arranca el servidor
exec superset run -p 8088 --with-threads --reload --debugger
