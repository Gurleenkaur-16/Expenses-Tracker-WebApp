# stage 1 Build the JAR(java application runtime) using maven

FROM maven:3.9.9-eclipse-temurin-17-alpine AS builder

WORKDIR /app

COPY . .

# create JAR file

RUN mvn clean install -DskipTests=true

# stage 2 execute JAR file from the above stage

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar /app/expenseapp.jar

CMD ["java" , "-jar" , "expenseapp.jar" ]

