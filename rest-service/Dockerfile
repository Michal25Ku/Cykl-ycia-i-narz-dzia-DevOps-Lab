# Wybieramy oficjalny obraz openjdk 17 jako bazowy
FROM openjdk:17-jdk-slim

# Ustawienie katalogu roboczego w kontenerze
WORKDIR /app

# Skopiowanie gotowego pliku JAR z kontenera budującego do kontenera uruchamiającego
COPY target/demo-0.0.1-SNAPSHOT.jar /app/demo.jar

# Ekspozycja portu 8080, na którym działa aplikacja
EXPOSE 8080

# Uruchomienie aplikacji Spring Boot przy starcie kontenera
ENTRYPOINT ["java", "-jar", "/app/demo.jar"]
