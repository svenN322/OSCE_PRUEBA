FROM apache/superset:latest

USER root

# Instala librerías necesarias (si las necesitas)
RUN pip install --no-cache-dir psycopg2-binary

# Copia tu archivo de configuración personalizado
COPY superset_config.py /app/superset_config.py

# Copia tu script de entrada
COPY entrypoint.sh /app/entrypoint.sh

# Dale permisos de ejecución
RUN chmod +x /app/entrypoint.sh

# Establece la variable de entorno para que Superset use tu config
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

# Vuelve a usar el usuario 'superset'
USER superset

# Expón el puerto que Render necesita detectar
EXPOSE 8088

# Usa el script como punto de entrada
ENTRYPOINT ["/app/entrypoint.sh"]
