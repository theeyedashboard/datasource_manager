# TheEyeDashboard - Datasource microservice

Datasources REST microservice

---

### Build & run with Docker
```shell
# build
docker-compose build
# run
docker-compose up
```
```shell
# check
wget [dockerhost]:8002
```

### Run tests
```shell
# app container must be built and running
docker-compose up
# exec rspec
docker exec -t -i datasourcemanager_datasourcemanager_1 rspec
```

### Force rebuild
```shell
docker-compose build
```
