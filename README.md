# JHipster Travis Tester

[![Build Status][travis-image]][travis-url]

Travis build for pull requests: [jhipster-travis-tester/pull_requests](https://travis-ci.org/pascalgrimaud/jhipster-travis-tester/pull_requests)

# Introduction

This project is used to test with Travis a JHipster project.

# How to use

Simply change the `app/` folder by:
- editing the `app/.yo-rc.json` file
- editing the `app/config.sh` file, if you want to use a specific version of JHipster
- editing the `app/test.sh` file, to define the appropriate tests

You can add entities by:
- adding all json file to `.jhipster/`
- adding a `file.jdl`

Then, you can pull request.

Of course, you can fork the project and link your Travis account with your github project. So, you don't need to pull request.

[travis-image]: https://travis-ci.org/pascalgrimaud/jhipster-travis-tester.svg?branch=master
[travis-url]: https://travis-ci.org/pascalgrimaud/jhipster-travis-tester
