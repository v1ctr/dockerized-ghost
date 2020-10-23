#!/bin/sh

# Load Environment Variables
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

echo backing up ghost data...
docker-compose stop ghost
docker-compose run --rm ghost-backup
docker-compose start ghost
echo uploading ghost_data to $BACKUP_URL
curl -F 'filename=ghost_data.tar.bz2' -F 'files[]=@backup/ghost_data.tar.bz2' -H 'X-BACKUP-TOKEN: '"$BACKUP_TOKEN"'' $BACKUP_URL
echo backed up ghost data.

echo backing up database data...
docker-compose stop db
docker-compose run --rm db-backup
docker-compose start db
echo uploading db_data to $BACKUP_URL
curl -F 'filename=db_data.tar.bz2' -F 'files[]=@backup/db_data.tar.bz2' -H 'X-BACKUP-TOKEN: '"$BACKUP_TOKEN"'' $BACKUP_URL
echo backed up database data.