FROM tensorflow/tensorflow:latest-gpu AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN python -m compileall -b .

FROM tensorflow/tensorflow:latest-gpu
WORKDIR /app
COPY --from=builder /app/__pycache__ .
COPY --from=builder /usr/local/lib/python3.8/dist-packages /usr/local/lib/python3.8/dist-packages
RUN useradd -m tfuser
USER tfuser
CMD ["python", "train_model.pyc"]