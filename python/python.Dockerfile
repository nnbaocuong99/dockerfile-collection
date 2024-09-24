# Python Dockerfile Template

# Base image options (uncomment one)
FROM python:3.9-slim-buster
# FROM python:3.9-alpine
# FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project
COPY . .

# Run tests (uncomment if needed)
# RUN python -m pytest

# Collect static files (uncomment for Django projects)
# RUN python manage.py collectstatic --noinput

# Run migrations (uncomment for Django projects)
# RUN python manage.py migrate

# Gunicorn options (uncomment and adjust for production)
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "your_project.wsgi:application"]

# Development server (comment out for production)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Expose port
EXPOSE 8000

# Optional: Add health check
HEALTHCHECK CMD curl --fail http://localhost:8000 || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Set up a non-root user
# RUN adduser --disabled-password --gecos '' myuser
# USER myuser
