FROM mcr.microsoft.com/dotnet/sdk 
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
COPY . madeupfolder
WORKDIR /madeupfolder
RUN dotnet build 
WORKDIR /madeupfolder/DotnetTemplate.Web
RUN apt-get update && apt-get install -y build-essential
RUN npm install 
RUN npm run build
RUN npm t 
RUN npm run lint
WORKDIR /madeupfolder
RUN dotnet test
WORKDIR /madeupfolder/DotnetTemplate.Web
ENTRYPOINT ["dotnet", "run"] 
