#!/bin/bash
set -ev

#-------------------------------------------------------------------------------
# Update npm
#-------------------------------------------------------------------------------
npm install -g npm

#-------------------------------------------------------------------------------
# Install yarn
#-------------------------------------------------------------------------------
npm install -g yarn

#-------------------------------------------------------------------------------
# Install yeoman, bower and gulp
#-------------------------------------------------------------------------------
yarn global add yo bower gulp-cli

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
yarn install
yarn link
