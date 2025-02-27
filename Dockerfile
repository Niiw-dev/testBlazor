# Usamos una imagen base de .NET SDK para desarrollo
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Establecer el directorio de trabajo
WORKDIR /app/blazor

# Copiar solo los archivos de proyecto primero para aprovechar el caché de Docker
COPY *.csproj ./

# Restaurar las dependencias de NuGet
RUN dotnet restore

# Copiar el resto de los archivos
COPY . .

# Limpiar el caché de NuGet (opcional pero recomendado para optimizar el tamaño)
RUN dotnet nuget locals all --clear

# Exponer el puerto 80 para la aplicación Blazor
EXPOSE 80

# Ejecutar las migraciones de la base de datos si fuera necesario
# RUN dotnet ef database update (si tienes migraciones en tu proyecto Blazor)

# Comando por defecto para ejecutar el servidor de desarrollo
CMD ["dotnet", "watch", "run", "--urls", "http://0.0.0.0:80"]
