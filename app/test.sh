#!/bin/bash
set -ev

################################################################################
# go into project
################################################################################
cd "$HOME"/app
yarn link generator-jhipster
cat .yo-rc.json

################################################################################
# generate project
################################################################################
yo jhipster --force --no-insight

################################################################################
# generate entities
################################################################################
# for f in `ls .jhipster` ; do yo jhipster:entity ${f%.*} --force ; done
# for f in `ls *.jh *.jdl` ; do yo jhipster:import-jdl ${f%} --force ; done

# display app folder
ls -al "$HOME"/app/

################################################################################
# launch tests
################################################################################
./mvnw clean
./mvnw test
gulp test
gulp eslint --no-notification
docker-compose -f src/main/docker/mysql.yml up -d
sleep 20
./mvnw clean package -Pprod -DskipTests
java -jar target/*.war &
sleep 60
curl -v http://localhost:8080
