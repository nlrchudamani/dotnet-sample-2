FROM mcr.microsoft.com/dotnet/sdk:5.0

ARG BUILD_CONFIGURATION=Debug
ENV ASPNETCORE_ENVIRONMENT=Development
ENV DOTNET_USE_POLLING_FILE_WATCHER=true  
ENV ASPNETCORE_URLS=http://+:5000

WORKDIR /app

COPY . .

RUN dotnet build -c Release 

EXPOSE 5000

ENTRYPOINT [ "dotnet","run","--no-launch-profile" ]
