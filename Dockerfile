# Usamos una imagen base de .NET SDK para desarrollo
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Establecemos el directorio de trabajo para el contenedor
WORKDIR /app/blazor

# Copiamos los archivos del proyecto Blazor al contenedor
COPY . .

# Restauramos las dependencias de NuGet
RUN dotnet restore

# Exponemos el puerto necesario para la aplicación Blazor
EXPOSE 80

# Usamos el comando para ejecutar el servidor de desarrollo de .NET
ENTRYPOINT ["dotnet", "watch", "run", "--urls", "http://0.0.0.0:80"]
