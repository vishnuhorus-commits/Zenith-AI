FROM python:3.11-slim

# Reduce image size and improve reproducibility
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install build deps if needed (commented)
# RUN apt-get update && apt-get install -y --no-install-recommends build-essential

# Copy only requirements first for better layer caching
COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy repo
COPY . .

# Expose Flask default port
EXPOSE 5000

# Use gunicorn and ensure it uses the Backend dir where app.py lives
CMD ["gunicorn", "app:app", "--chdir", "Backend", "--bind", "0.0.0.0:5000", "--workers", "2"]
