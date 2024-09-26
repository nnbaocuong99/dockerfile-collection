FROM python:3.9-slim-buster as builder
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends gcc
COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt

FROM python:3.9-slim-buster
WORKDIR /app
COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .
RUN pip install --no-cache /wheels/*
COPY ./app ./app
RUN adduser --system --no-create-home nonroot
USER nonroot
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]