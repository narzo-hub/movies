FROM python:3.10-slim-bullseye

# Install git and dependencies
RUN apt-get update && \
    apt-get install -y git libjpeg-dev libpng-dev && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

EXPOSE 8080
CMD ["python", "app.py"]
