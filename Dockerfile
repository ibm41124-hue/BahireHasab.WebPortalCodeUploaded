FROM ://microsoft.com AS build-env
WORKDIR /app

COPY . ./
RUN dotnet publish "BahireHasab.WebPortal.csproj" -c Release -o out

FROM ://microsoft.com
WORKDIR /app
COPY --from=build-env /app/out .

ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "BahireHasab.WebPortal.dll"]
