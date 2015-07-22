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

### Test REST with CURL
```shell
# GET '/' : return all datasources
curl http://[dockerhost]:8002
# GET '/ID' : return datasource with ID
curl http://[dockerhost]:8002/[ID]
# POST '/' : create a new datasource
curl -H "Content-Type: application/json" -X POST -d '{"_id":"1","description":"Description for datasource","title":"Datasource"}' http://[dockerhost]:8002/
# PUT '/ID' : update a datasource
curl -H "Content-Type: application/json" -X PUT -d '{"description":"Updated description for datasource","title":"Datasource modified"}' http://[dockerhost]:8002/1
# DELETE '/ID' : delete a datasource
curl -X DELETE http://[dockerhost]:8002/1
```

### Run tests
```shell
# you must have boot2docker, docker-compose installed
./run_tests.sh
```

### Automated tests on push
```shell
ln -s ../../pre-commit.sh .git/hooks/pre-push
```

### Force rebuild
```shell
docker-compose build
```
