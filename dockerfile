# use a lightweight Python image as the base
FROM python:3.12-slim

# set the working directory in the container
WORKDIR /app

# copy the requirements file to the working directory
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code (the entire sample_app folder) to the working directory /app
# This way, sample_app/ will be a subdirectory of /app/
COPY ./sample_app /app/sample_app

# Expose port 5000 (if your app actually listens on it, which is not the case for a simple script)
# If it's a simple script that doesn't listen on a port, you can remove this line.
# EXPOSE 5000

# Define the default command to run when the container starts
# Run the 'sample_app' PACKAGE as a module.
# This makes Python handle relative imports correctly.
ENTRYPOINT ["python", "-m", "sample_app"]
# Provide default arguments for the script, which can be overridden when running the container
#CMD ["5", "3"]