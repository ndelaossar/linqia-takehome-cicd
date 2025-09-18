# Usa una imagen base oficial de Python. La versión 'slim' es más ligera.
FROM python:3.12-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia primero el archivo de dependencias para aprovechar el caché de Docker
# Si este archivo no cambia, Docker no reinstalará las dependencias en cada build
COPY requirements.txt .

# Instala las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia el código de tu aplicación (la carpeta sample_app entera) al directorio de trabajo /app
# De esta forma, sample_app/ será un subdirectorio de /app/
COPY ./sample_app /app/sample_app

# Expone el puerto 5000 (si tu app realmente escucha en él, lo cual no es el caso para un script simple)
# Si es un script simple que no escucha en un puerto, puedes eliminar esta línea.
# EXPOSE 5000

# Define el comando por defecto que se ejecutará cuando el contenedor inicie
# Ejecuta el PAQUETE 'sample_app' como un módulo.
# Esto hace que Python maneje las importaciones relativas correctamente.
CMD ["python", "-m", "sample_app"]