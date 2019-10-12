#!/bin/sh

docker exec -i ace_db_1 sh -c 'echo "drop database ace_auth" | exec mysql'
docker exec -i ace_db_1 sh -c 'echo "drop database ace_world" | exec mysql'
docker exec -i ace_db_1 sh -c 'echo "drop database ace_shard" | exec mysql'

docker exec -i ace_db_1 sh -c 'echo "create database ace_auth" | exec mysql'
docker exec -i ace_db_1 sh -c 'echo "create database ace_world" | exec mysql'
docker exec -i ace_db_1 sh -c 'echo "create database ace_shard" | exec mysql'

docker exec -i ace_db_1 sh -c 'exec mysql' < Database/Base/AuthenticationBase.sql
docker exec -i ace_db_1 sh -c 'exec mysql' < Database/Base/ShardBase.sql

wget https://github.com/ACEmulator/ACE-World-16PY-Patches/releases/download/v0.9.131/ACE-World-Database-v0.9.131.sql.zip
unzip ACE-World-Database-v0.9.131.sql.zip
docker exec -i ace_db_1 sh -c 'exec mysql' < ACE-World-Database-v0.9.131.sql
