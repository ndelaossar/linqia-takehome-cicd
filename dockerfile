# Usa una imagen base oficial de Python. La versión 'slim' es más ligera.
FROM python:3.10-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia primero el archivo de dependencias para aprovechar el caché de Docker
# Si este archivo no cambia, Docker no reinstalará las dependencias en cada build
COPY requirements.txt .

# Instala las dependencias de Python
RUN if [ -s requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Copia el código de tu aplicación al directorio de trabajo
COPY ./sample_app/* /app/

# Expone el puerto 5000 para informar a Docker que el contenedor escuchará en este puerto
EXPOSE 5000

# Define el comando por defecto que se ejecutará cuando el contenedor inicie
CMD ["python", "__main__.py", "--host", "0.0.0.0"]