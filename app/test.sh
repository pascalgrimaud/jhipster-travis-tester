#!/bin/bash
set -ev

./mvnw clean
./mvnw test
gulp test
gulp eslint
docker-compose -f src/main/docker/mysql.yml up -d
sleep 20
./mvnw clean package -Pprod -DskipTest
java -jar target/*.war &
sleep 120
