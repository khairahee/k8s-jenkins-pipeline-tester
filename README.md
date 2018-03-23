# k8s-jenkins-pipeline-tester
A complete example of an app using the k8s-jenkins to deploy a pipeline

#### Available on [Docker hub](https://hub.docker.com/r/microdc/k8s-jenkins-pipeline-tester/)
```
docker run -p 8989:5000 microdc/k8s-jenkins-pipeline-tester:latest
```

#### Run locally for dev
```
./run.sh
```
#### Build a container then run locally with docker
```
export VERSION='latest'
./build.sh
docker run -p 8989:5000 microdc/k8s-jenkins-pipeline-tester:latest
```
browse to [http://localhost:8989](http://localhost:8989)

#### Test & Lint
```
./test.sh
```

### Contribution guidelines

* Write tests
* Code review
* Pull request

