# Lua Dockerfile Template

FROM alpine:3.14

# Install Lua and LuaRocks (Lua package manager)
RUN apk add --no-cache lua5.3 luarocks5.3

WORKDIR /app

# Copy Lua files
COPY . .

# Install Lua dependencies (if you're using a rockspec file)
# RUN luarocks install myapp-1.0-1.rockspec

# Expose port (if your application uses network)
EXPOSE 8080

# Run the Lua script
CMD ["lua5.3", "app.lua"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN adduser -D appuser
# USER appuser
