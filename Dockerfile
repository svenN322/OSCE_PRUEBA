FROM apache/superset:latest

# Puedes instalar extensiones si las necesitas
USER root
RUN pip install --no-cache-dir psycopg2-binary

# Set the default user back to superset
USER superset
