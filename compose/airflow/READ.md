https://github.com/puckel/docker-airflow
https://registry.hub.docker.com/r/puckel/docker-airflow


https://registry.hub.docker.com/r/bitnami/airflow


https://www.youtube.com/watch?v=AHMm1wfGuHE&list=PLYizQ5FvN6pvIOcOd6dFZu3lQqc6zBGp2&ab_channel=ApplyDataScience


https://towardsdatascience.com/getting-started-with-airflow-using-docker-cd8b44dbff98


https://medium.com/twodigits/master-devops-data-architecture-with-apache-airflow-kubernetes-and-talend-60368e63e14f

###compose
```shell
docker-compose -f docker-compose-CeleryExecutor.yml up -d
docker-compose -f docker-compose-CeleryExecutor.yml scale worker=2
docker-compose -f docker-compose-CeleryExecutor.yml down
```