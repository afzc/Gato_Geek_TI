##k0s

docs

https://www.youtube.com/watch?v=netJ0Nuj_tw&ab_channel=PeladoNerd

https://www.mirantis.com/blog/how-to-set-up-k0s-kubernetes-a-quick-and-dirty-guide/

https://hub.docker.com/r/k0sproject/k0s/tags?page=1&ordering=last_updated

https://github.com/k0sproject/k0s/blob/main/docs/k0s-in-docker.md

https://docs.k0sproject.io/latest/create-cluster/

---
###docker k0s
```shell
docker pull k0sproject/k0s
docker run -d --name k0s --hostname k0s --privileged -v /var/lib/k0s -p 6443:6443 k0sproject/k0s:latest
#docker exec -it k0s bash
#cp /var/lib/k0s/pki/admin.conf admin.conf
docker cp k0s:/var/lib/k0s/pki/admin.conf .
#add to kubie ctx for kubectl

# add worker
#docker exec -t -i k0s k0s token create --role=worker > token-worker
token=$(docker exec -t -i k0s k0s token create --role=worker)
docker run -d --name k0s-w1 --hostname k0s-w1 --privileged -v /var/lib/k0s k0sproject/k0s:latest k0s worker $token
```
---
### custome try with ubuntu
docker run -itd --name k0su --hostname k0su --privileged k0s-ubuntu:20.04

docker cp k0s.yaml k0su:/k0s.yaml

docker exec -it k0su bash

k0s server -c k0s.yaml &

cp /var/lib/k0s/pki/admin.conf admin.conf

docker cp k0su:/admin.conf admin-k0su.conf

token=$(docker exec -t -i k0su k0s token create --role=worker)

docker run -itd --name k0su-w --hostname k0su-w --privileged k0s-ubuntu:20.04

docker exec -it k0su-w bash

++token
