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
yo jhipster --force --no-insight --with-entities

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

yarn run webpack:build
echo 'hello!'
