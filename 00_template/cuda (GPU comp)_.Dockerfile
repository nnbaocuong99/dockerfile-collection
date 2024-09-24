FROM nvidia/cuda:11.3.1-base-ubuntu20.04 AS builder
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
RUN python3 -m compileall -b .

FROM nvidia/cuda:11.3.1-base-ubuntu20.04
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /app/__pycache__ .
COPY --from=builder /usr/local/lib/python3.8/dist-packages /usr/local/lib/python3.8/dist-packages
RUN useradd -m cudauser
USER cudauser
CMD ["python3", "gpu_script.pyc"]