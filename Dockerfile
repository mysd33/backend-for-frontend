# Dockerfile for sample service using embedded tomcat server

#FROM amazoncorretto:8-alpine
#RUN addgroup -S -g 1000 app \
#    && adduser -D -S -G app -u 1000 -s /bin/ash app
#USER app
#WORKDIR /home/app
#COPY target/mynavi-sample-aws-ecs-backend-for-frontend-0.0.1-SNAPSHOT.jar /home/app

FROM public.ecr.aws/amazoncorretto/amazoncorretto:11
RUN yum install -y shadow-utils
ARG USERNAME=app
ARG GROUPNAME=app
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME/

COPY target/mynavi-sample-aws-ecs-backend-for-frontend-0.0.1-SNAPSHOT.jar /home/$USERNAME
CMD java -jar -Dspring.profiles.active=$ENV_TYPE -Dservice.dns=$BACKEND_URL /home/app/mynavi-sample-aws-ecs-backend-for-frontend-0.0.1-SNAPSHOT.jar
