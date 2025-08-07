FROM python:3.12-slim

# Install dependencies
RUN apt-get update && apt-get install -y git build-essential libjpeg-dev zlib1g-dev libssl-dev libffi-dev

# Copy requirements file
COPY requirements.txt /requirements.txt

# Install requirements
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy application code
COPY . /app/

# Expose port
EXPOSE 8080
