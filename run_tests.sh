# Build service with dependencies and run tests
docker-compose build
docker-compose up -d
sleep 1
docker exec -t datasourcemanager_datasourcemanager_1 rspec
# docker exec -ti datasourcemanager_datasourcemanager_1 script -q -c "rspec" /dev/null
RESULT=$?
docker-compose stop
[ $RESULT -ne 0 ] && exit 1
exit 0
