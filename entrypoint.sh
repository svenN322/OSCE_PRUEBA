#!/bin/bash
set -e

# Espera a que la base de datos esté disponible (opcional)
# Puedes usar: wait-for-it.sh o sleep 10

# Inicializa superset y crea admin si no existe
superset db upgrade
superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@example.com \
    --password admin || true
superset init

# Ejecuta el comando que venga después (CMD)
exec "$@"
