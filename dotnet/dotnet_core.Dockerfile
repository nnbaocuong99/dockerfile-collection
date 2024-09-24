# .NET Core Dockerfile Template

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src

# Copy csproj and restore as distinct layers
COPY ["YourProject.csproj", "./"]
RUN dotnet restore "YourProject.csproj"

# Copy everything else and build
COPY . .
RUN dotnet build "YourProject.csproj" -c Release -o /app/build

# Publish stage
FROM build AS publish
RUN dotnet publish "YourProject.csproj" -c Release -o /app/publish

# Run stage
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Set environment variables
ENV ASPNETCORE_URLS=http://+:80
ENV ASPNETCORE_ENVIRONMENT=Production

# Expose port
EXPOSE 80

# Start the app
ENTRYPOINT ["dotnet", "YourProject.dll"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:80/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
