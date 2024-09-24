FROM denoland/deno:1.12.2
WORKDIR /app
COPY deps.ts .
RUN deno cache deps.ts
COPY . .
RUN deno cache main.ts
RUN addgroup --system denouser && adduser --system --ingroup denouser denouser
USER denouser
EXPOSE 8000
CMD ["deno", "run", "--allow-net", "main.ts"]