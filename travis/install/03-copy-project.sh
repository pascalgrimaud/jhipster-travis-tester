#!/bin/bash
set -ev
#-------------------------------------------------------------------------------
# Force no insight
#-------------------------------------------------------------------------------
mkdir -p "$HOME"/.config/configstore/
mv "$JHIPSTER_TRAVIS"/configstore/*.json "$HOME"/.config/configstore/

#-------------------------------------------------------------------------------
# Copy app folder
#-------------------------------------------------------------------------------
cp -R $TRAVIS_BUILD_DIR/app "$HOME"
ls -al "$HOME"/app
