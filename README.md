# mlflow-tutorial-gcp
mlflow tutorial for gcp free plan. that project's driven by もったいない mind, not production usage.

## Usage
```
DOCKER_BUILDKIT=1 docker build -t mlflow-server .
```

```
docker run --rm --name mlflow-server -p 80:80 -v ${PWD}/mlruns/:/mlruns/ -v  mlflow
```

## Todo
- IaC
- reafactoring Dockerfile
- implement nginx-proxy for authentication
- https
