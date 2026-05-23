# Use the official Microsoft .NET SDK image to build the app
FROM ://microsoft.com AS build-env
WORKDIR /app

# Copy everything and restore/publish the project
COPY . ./
RUN dotnet publish "BahireHasab.WebPortal.csproj" -c Release -o out

# Build runtime image
FROM ://microsoft.com
WORKDIR /app
COPY --from=build-env /app/out .

# Expose port 8080 for web traffic
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "BahireHasab.WebPortal.dll"]
