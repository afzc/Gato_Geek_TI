##ISTIO
docs:
https://istio.io/latest/about/service-mesh/

install: https://istio.io/latest/docs/setup/getting-started/#download

tuto: https://www.youtube.com/watch?v=ofJ5swfP2kQ&ab_channel=PeladoNerd

---
####istio init
```shell
# install in kubernetes
istioctl install --set profile=demo -y
# adding dashboard
kubectl apply -f samples/addons
kubectl rollout status deployment/kiali -n istio-system
istioctl dashboard kiali
# Loadbalancer enable in minikube
minikube tunnel
# expose grafana
kubectl expose deployment -n istio-system grafana --port=8081 --target-port=3000 --type=LoadBalancer --name=dash-grafana-web
```
####istio implements
```shell
# adding namespace for demo 
kubectl create namespace hello
# enable istio in namespace
kubectl label namespace hello istio-injection=enabled
# pull image in kubernetes
eval $(minikube docker-env)
docker pull afzc/hello-app:1.0.0
# deploy
kubectl apply -f 1-hello-app.yaml --namespace=hello
kubectl apply -f 2-hello-app.yaml --namespace=hello
# check deploy
kubectl describe pod <pod-name> -n hello
# GET from v2 to v1
kubectl exec -it pod/<pod-name> --namespace=hello sh
# cmd inside pod v2
while sleep 1; do curl -o /dev/null -s -w %{http_code} http://hello-1-svc:80/; done
```
####istio adding ingress to our pods
docs:
https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/
```shell
kubectl apply -f 3-ingress.yaml --namespace=hello
# check if issue
istioctl analyze -n hello
# using (note: needed minikube tunnel)
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export INGRESS_HOST=$(minikube ip)
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo "$INGRESS_PORT"
echo "$INGRESS_HOST"
echo "$GATEWAY_URL"
# do gets
curl "http://$GATEWAY_URL/h1"
curl "http://$GATEWAY_URL/h2"

while sleep 3; do curl "http://$GATEWAY_URL/h1" && curl "http://$GATEWAY_URL/h2"; done
```