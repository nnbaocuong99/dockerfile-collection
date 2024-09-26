FROM gcc:latest AS builder
WORKDIR /app
COPY . .
RUN gfortran -O3 -static -o myapp main.f90

FROM scratch
COPY --from=builder /app/myapp /myapp
CMD ["/myapp"]