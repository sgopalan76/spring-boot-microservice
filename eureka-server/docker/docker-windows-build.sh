#!/bin/bash

cd ..

mvn clean package docker:build -DskipTests=true

docker rm -f adgs-eureka-server

docker run \
    --restart=always \
    --name adgs-eureka-server \
    --net spring-microservice-network \
    -p 18070:18070 \
    -v C:\\temp\\docker\\spring\\microservices\\logs:/var/log/spring/microservices \
    -d aldwindelgado/spring-microservice-github-sample-eureka-server