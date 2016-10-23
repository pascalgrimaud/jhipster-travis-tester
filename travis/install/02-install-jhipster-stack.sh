#!/bin/bash
set -ev

#-------------------------------------------------------------------------------
# Update npm
#-------------------------------------------------------------------------------
npm install -g npm

#-------------------------------------------------------------------------------
# Install yeoman, bower and gulp
#-------------------------------------------------------------------------------
npm install -g yo bower gulp-cli

#-------------------------------------------------------------------------------
# Install JHipster
#-------------------------------------------------------------------------------
git clone $JHIPSTER_REPO generator-jhipster
cd generator-jhipster
if [ "$JHIPSTER_BRANCH" != "master" ]; then
    git checkout $JHIPSTER_BRANCH $JHIPSTER_BRANCH
fi
npm install
npm link
