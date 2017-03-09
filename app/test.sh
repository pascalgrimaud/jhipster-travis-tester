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
# for f in `ls .jhipster` ; do yo jhipster:entity ${f%.*} --force ; done
# for f in `ls *.jh *.jdl` ; do yo jhipster:import-jdl ${f%} --force ; done
yo jhipster:import-jdl jhipster.jdl

# display app folder
ls -al "$HOME"/app/
ls -al "$HOME"/app/.jhipster/

################################################################################
# launch tests
################################################################################
docker-compose -f src/main/docker/mysql.yml up -d

./mvnw clean test
