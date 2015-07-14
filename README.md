# TheEyeDashboard - Datasource microservice

Datasources REST microservice

---

### Build, test & run with Docker
```shell
docker-compose up
```
```shell
wget [dockerhost]:8002
```

### Force rebuild/test
```shell
docker-compose build
```
```shell
Building datasourcemanager...
Step 0 : FROM ruby
 ---> a1ed99fd54db
...
Step 8 : RUN rspec
 ---> Running in fbfeb3fb90f5
.

Finished in 0.03623 seconds (files took 0.4083 seconds to load)
1 example, 0 failures

...
Successfully built 439369d7736d
```
