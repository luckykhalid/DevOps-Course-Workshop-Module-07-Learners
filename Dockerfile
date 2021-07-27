FROM mcr.microsoft.com/dotnet/sdk:latest
ENV DOTNET_CLI_HOME="/tmp/DOTNET_CLI_HOME"
RUN apt-get update && apt-get install -y && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
      && apt-get install -y nodejs
WORKDIR /app
COPY . .
WORKDIR /app/DotnetTemplate.Web
RUN npm install && npm run build && dotnet build
ENTRYPOINT ["dotnet", "run"]
