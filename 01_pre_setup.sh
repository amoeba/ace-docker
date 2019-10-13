#!/bin/sh

set -e

if [ ! -d ACE ]; then
  echo "Downloading ACE source..."
  git clone https://github.com/ACEmulator/ACE
else
  echo "ACE source OK. Skipping."
fi

if [ ! -f ACE/Source/ACE.Server/Config.js ]; then
  cp ACE/Source/ACE.Server/Config.js.example ACE/Source/ACE.Server/Config.js
else
  echo "ACE source and Config.js OK. Skipping."
fi

if [ -d ACE ]; then
  echo "ACE source OK."
else
  echo "ACE source NOT OK."
fi

if [ -f ACE/Source/ACE.Server/Config.js ]; then
  echo "ACE Config.js OK."
else
  echo "ACE Config.js NOT OK."
fi

if [ ! -f dats/client_cell_1.dat ]; then
  echo "client_cell_1.dat not found in ./dats folder. Stopping."
  exit
else
  echo "client_cell_1.dat OK."
fi

if [ ! -f dats/client_portal.dat ]; then
  echo "client_portal.dat not found in ./dats folder. Stopping."
  exit
else
  echo "client_portal.dat OK."
fi

echo "Starting the database..."
docker-compose up -d db
echo "Done. Now run 02_setup_db.sh"
