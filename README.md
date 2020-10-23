# dockerized-ghost
## Installing Ghost CMS with Docker Compose

1. Create ```.env``` file in main project directory ```dockerized-ghost``` and define 
   environment variables:
   ```
   MYSQL_ROOT_PASSWORD=your_root_password
   MYSQL_USER=your_ghost_database_user
   MYSQL_PASSWORD=your_ghost_database_password
   
   GHOST_URL=your_ghost_url
   ```
2. Run ```docker-compose -p dockerized-ghost up -d```

## Backing Ghost CMS up

1. Run ```sh backup.sh``` to

## Restoring Ghost CMS

1. To restore from `backup/dbdata.tar.bz2`, do:
    ```shell script
   docker-compose run --rm ghost-restore
   ```