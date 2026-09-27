#Use the official Python image from Docker Hub as the base image
FROM python:3.11-slim 

# Set the working directory inside the container to /app
WORKDIR /app 

# Install dependencies first (better layer caching — this layer only
# rebuilds when requirements.txt changes, not on every code change)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the application code
COPY . .

# The Flask app listens on this port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]