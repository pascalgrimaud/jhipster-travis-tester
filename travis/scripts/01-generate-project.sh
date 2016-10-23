#!/bin/bash
set -ev
#-------------------------------------------------------------------------------
# Force no insight
#-------------------------------------------------------------------------------
mkdir -p "$HOME"/.config/configstore/
mv "$JHIPSTER_TRAVIS"/configstore/*.json "$HOME"/.config/configstore/

#-------------------------------------------------------------------------------
# Generate the project with yo jhipster
#-------------------------------------------------------------------------------
if [ "$JHIPSTER" == "app-gateway-uaa" ]; then
    mkdir -p "$HOME"/uaa
    mv -f "$JHIPSTER_SAMPLES"/"$JHIPSTER"/uaa/.yo-rc.json "$HOME"/uaa/
    cd "$HOME"/uaa
    yo jhipster --force --no-insight
    ls -al "$HOME"/uaa
fi

mkdir -p "$HOME"/app
cp $TRAVIS_BUILD_DIR/app/.yo-rc.json $HOME/app/
cp $TRAVIS_BUILD_DIR/app/*.jh $HOME/app/
cp $TRAVIS_BUILD_DIR/app/*.jdl $HOME/app/
cp -R $TRAVIS_BUILD_DIR/app/.jhipster/ $HOME/app/

cd "$HOME"/app
npm link generator-jhipster
yo jhipster --force --no-insight

for f in `ls .jhipster` do yo jhipster:entity ${f%.*} --force ; done
for f in `ls *.jh *.jdl` do yo jhipster:import-jdl ${f%.*} --force ; done

ls -al "$HOME"/app
