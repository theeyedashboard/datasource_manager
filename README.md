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
# you must have boot2docker, docker-compose installed
./run_tests.sh
```

### automated tests on push
```shell
ln -s ../../pre-commit.sh .git/hooks/pre-push
```

### Force rebuild
```shell
docker-compose build
```
