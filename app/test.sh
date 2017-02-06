#!/bin/bash
set -ev

################################################################################
# go into project
################################################################################
cd "$HOME"/app
yarn link generator-jhipster
# npm link generator-jhipster
cat .yo-rc.json

################################################################################
# generate project
################################################################################
yo jhipster --force --no-insight

################################################################################
# generate entities
################################################################################
for f in `ls .jhipster` ; do yo jhipster:entity ${f%.*} --force ; done
# for f in `ls *.jh *.jdl` ; do yo jhipster:import-jdl ${f%} --force ; done

# display app folder
ls -al "$HOME"/app/

yo jhipster:info

################################################################################
# launch tests
################################################################################
docker-compose -f src/main/docker/postgresql.yml up -d

./mvnw clean test

gulp test

./mvnw -Pprod clean package -DskipTests
docker ps -a

java -jar target/*.war --spring.output.ansi.enabled=ALWAYS &
sleep 60
curl -v http://localhost:8080
gulp itest
