#!/bin/sh

set -e

echo "Dropping databases..."
docker-compose exec -T db sh -c 'echo "drop database ace_auth" | exec mysql'
docker-compose exec -T db sh -c 'echo "drop database ace_world" | exec mysql'
docker-compose exec -T db sh -c 'echo "drop database ace_shard" | exec mysql'
echo "Done."
