# 빌드 단계
FROM openjdk:17 AS builder
WORKDIR /app
COPY . .
RUN chmod +x gradlew  # gradlew 실행 권한 부여
RUN ./gradlew build   # Gradle로 빌드

# 실행 단계
FROM openjdk:17
WORKDIR /app
COPY --from=builder /app/build/libs/render-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]