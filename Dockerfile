# Dockerfile for sample service using embedded tomcat server

#FROM amazoncorretto:8-alpine
FROM public.ecr.aws/amazoncorretto/amazoncorretto:8

RUN addgroup -S -g 1000 app \
    && adduser -D -S -G app -u 1000 -s /bin/ash app
USER app
WORKDIR /home/app
COPY target/mynavi-sample-aws-ecs-backend-for-frontend-0.0.1-SNAPSHOT.jar /home/app

CMD java -jar -Dspring.profiles.active=$ENV_TYPE /home/app/mynavi-sample-aws-ecs-backend-for-frontend-0.0.1-SNAPSHOT.jar
