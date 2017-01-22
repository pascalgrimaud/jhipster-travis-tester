#!/bin/bash
set -ev

#-------------------------------------------------------------------------------
# Install JHipster
#-------------------------------------------------------------------------------
git clone $JHIPSTER_REPO generator-jhipster
cd generator-jhipster
if [ "$JHIPSTER_BRANCH" == "latest" ]; then
    LATEST=$(git describe --abbrev=0)
    git checkout -b $LATEST $LATEST
elif [ "$JHIPSTER_BRANCH" != "master" ]; then
    git checkout -b $JHIPSTER_BRANCH $JHIPSTER_BRANCH
fi
git --no-pager log -n 10 --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
yarn install
yarn link
# npm install
# npm link
