###airflow
```shell
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add kedacore https://kedacore.github.io/charts
helm repo add astronomer https://helm.astronomer.io
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm search repo grafana

kubectl create namespace airflow
kubectl create namespace monitoring

#repo dags
#https://github.com/afzc/airflow-dags.git

Kubernetes**
helm install flower -n airflow \
--set auth.username=admin \
--set auth.password=admin \
--set git.dags.enabled=true \
--set git.dags.repositories[0].repository=https://github.com/afzc/airflow-dags \
--set git.dags.repositories[0].branch=master \
--set git.dags.repositories[0].name=repodags \
--set metrics.enabled=true \
--set executor=KubernetesExecutor \
--set rbac.create=true \
--set serviceaccount.create=true \
bitnami/airflow

#Celery
#helm install flower -n airflow bitnami/airflow \
#--set auth.username=admin \
#--set auth.password=admin \
#--set git.dags.enabled=true \
#--set git.dags.repositories[0].repository=https://github.com/afzc/airflow-dags \
#--set git.dags.repositories[0].branch=master \
#--set git.dags.repositories[0].name=repodagsk \
#--set metrics.enabled=true

helm install dog -n monitoring prometheus-community/prometheus

helm install dash -n monitoring grafana/grafana

minikube tunnel

kubectl expose deployment -n monitoring dash-grafana --port=8081 --target-port=3000 --type=LoadBalancer --name=dash-grafana-web

#Celery
#kubectl expose deployment -n airflow flower-airflow-web --port=8080 --target-port=8080 --type=LoadBalancer

```