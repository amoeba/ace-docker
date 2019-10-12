# Copied and modified from paradox
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env

WORKDIR /aceserver
ADD Source .
RUN mkdir deploy \
  && dotnet restore \
  && dotnet publish -o /aceserver/deploy

FROM mcr.microsoft.com/dotnet/core/runtime:2.2

WORKDIR /aceserver
COPY --from=build-env /aceserver/deploy .

ENTRYPOINT [ "dotnet", "ACE.Server.dll" ]
