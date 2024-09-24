# F# Dockerfile Template

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

WORKDIR /app

# Copy project files
COPY *.fsproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o out

# Run stage
FROM mcr.microsoft.com/dotnet/aspnet:5.0

WORKDIR /app
COPY --from=build /app/out .

# Expose port (if your application uses network)
EXPOSE 80

# Run the application
ENTRYPOINT ["dotnet", "YourAppName.dll"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:80/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
