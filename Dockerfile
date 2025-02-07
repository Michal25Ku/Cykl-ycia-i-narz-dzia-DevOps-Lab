# Wybór obrazu bazowego do budowania aplikacji
FROM maven:3.8.8-eclipse-temurin-17 AS builder

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie pliku pom.xml i plików źródłowych do obrazu
COPY pom.xml .
COPY src ./src

# Budowanie aplikacji Spring Boot
RUN mvn clean install -DskipTests

# Obraz do uruchomienia aplikacji
FROM openjdk:17-jdk-slim

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie pliku JAR z poprzedniego etapu
COPY --from=builder /app/target/MichalKuciak-0.0.1-SNAPSHOT.jar app.jar

# Uruchomienie aplikacji Spring Boot
ENTRYPOINT ["java", "-jar", "app.jar"]

# Otworzenie portu, na którym działa aplikacja
EXPOSE 8080

