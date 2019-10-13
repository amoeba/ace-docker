# ace-docker

Not enitrely batteries-included Docker Compose setup for running an [ACE](https://github.com/ACEmulator/ACE) server.
Based on the Dockerfile paradox shared in Discord October 10, 2019.

## Pre-requisites

- Docker w/ `docker-compose`
- DATs
- git

## Steps

- Put DATs in ./dats
- Run `sh 01_pre_setup.sh`
- Run `sh 02_db_setup.sh`
- Run `docker-compose up`
