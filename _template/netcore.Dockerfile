FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["MyProject.csproj", "./"]
RUN dotnet restore "./MyProject.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "MyProject.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MyProject.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .
RUN adduser --disabled-password --gecos '' dotnetuser
USER dotnetuser
ENTRYPOINT ["dotnet", "MyProject.dll"]