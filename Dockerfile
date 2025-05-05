FROM apache/superset:latest

# Instala el driver para PostgreSQL
USER root
RUN pip install --no-cache-dir psycopg2-binary

# Copia el script de arranque personalizado
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Vuelve al usuario superset
USER superset

# Usa el entrypoint personalizado
ENTRYPOINT ["/app/entrypoint.sh"]
