# ace-docker

Not enitrely batteries-included Docker Compose setup for running an [ACE](https://github.com/ACEmulator/ACE) server.
Based on the Dockerfile paradox shared in Discord October 10, 2019.

## Pre-requisites

- Docker
- DATs
- [ACE Source](https://github.com/ACEmulator/ACE)

## Steps

- Put DATs in ./dats
- Put ACE `Source` folder at `Source`
- Edit Config.js

Then you need to docker-compose up, wait for the `ace` container to fail because the database isn't set up, run setup_db.sh, then re-run docker-compose up again.
