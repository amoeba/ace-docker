#!/bin/sh

set -e

if docker-compose exec -T db sh -c 'echo "use ace_auth" | mysql'; then
  echo "Database ace_auth already exists. Skipping databaset setup."
  echo "Now run docker-compose up or docker-compose up -d depending on what you want to do."
  exit
else
  echo "ace_auth doesn't exist, creating all databases and loading SQL..."
fi

echo "Creating databases..."
docker-compose exec -T db sh -c 'echo "create database ace_auth" | mysql'
docker-compose exec -T db sh -c 'echo "create database ace_world" | mysql'
docker-compose exec -T db sh -c 'echo "create database ace_shard" | mysql'
echo "Done."

echo "Importing AuthenticationBase.sql..."
docker-compose exec -T db sh -c 'mysql' < ACE/Database/Base/AuthenticationBase.sql
echo "Done."

echo "Importing ShardBase.sql..."
docker-compose exec -T db sh -c 'mysql' < ACE/Database/Base/ShardBase.sql
echo "Done."

echo "Downloading ACE-World...sql..."
wget https://github.com/ACEmulator/ACE-World-16PY-Patches/releases/download/v0.9.131/ACE-World-Database-v0.9.131.sql.zip
unzip ACE-World-Database-v0.9.131.sql.zip
echo "Done."

echo "Importing ACE-World-Database..."
docker-compose exec -T db sh -c 'mysql' < ACE-World-Database-v0.9.131.sql
echo "Done."

echo "Now run docker-compose up or docker-compose up -d depending on what you want to do."
