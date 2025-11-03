FROM maven:3.6.3-openjdk-8 AS build

WORKDIR /app

# Копируем pom.xml и скачиваем зависимости (для кэширования)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Копируем исходный код и собираем приложение
COPY src ./src
RUN mvn clean package -DskipTests

# Финальный образ
FROM openjdk:8-jre-slim

WORKDIR /app

# Копируем JAR файл из стадии сборки
COPY --from=build /app/target/*.jar app.jar

# Экспортируем порт (обычно Spring Boot использует 8080)
EXPOSE 8080

# Запускаем приложение
ENTRYPOINT ["java", "-jar", "app.jar"]
