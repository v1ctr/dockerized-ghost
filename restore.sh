#!/bin/sh

echo restoring ghost data...
docker-compose stop ghost
docker-compose run --rm ghost-restore
docker-compose start ghost
echo restored ghost data.