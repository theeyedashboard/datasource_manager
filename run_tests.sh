# Build service with dependencies and run tests
docker-compose build
docker-compose up -d
# sleep 1
docker exec -t -i datasourcemanager_datasourcemanager_1 rspec
docker-compose stop
