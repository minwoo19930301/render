# 빌드 단계
FROM openjdk:17 AS builder
WORKDIR /app

# 필요한 유틸리티 설치 (xargs 포함)
RUN apt-get update && apt-get install -y findutils

# 소스 코드 복사 및 빌드
COPY . .
RUN chmod +x gradlew
RUN ./gradlew build

# 실행 단계
FROM openjdk:17
WORKDIR /app
COPY --from=builder /app/build/libs/render-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]