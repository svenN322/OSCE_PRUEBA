FROM apache/superset:latest

USER root

# Instala librerías necesarias (si las necesitas)
RUN pip install --no-cache-dir psycopg2-binary

# Copia tu script de entrada
COPY entrypoint.sh /app/entrypoint.sh

# Dale permisos de ejecución
RUN chmod +x /app/entrypoint.sh

# Vuelve a usar el usuario 'superset'
USER superset

# Expón el puerto que Render necesita detectar
EXPOSE 8088

# Usa el script como punto de entrada
ENTRYPOINT ["/app/entrypoint.sh"]
