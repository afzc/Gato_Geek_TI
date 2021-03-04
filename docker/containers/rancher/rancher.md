###rancher
```shell
# network
docker network create -d bridge --subnet 192.168.1.0/24 --gateway 192.168.1.1 rancher-net
# rancher
docker run -d --restart=unless-stopped --name rancher --net=rancher-net -p 80:80 -p 443:443 rancher/rancher
# add worker to cluster
docker run --privileged --name worker -d --network rancher-net docker:dind
# in worker
hostname dockerNodo
mount --make-rshared /
#run cmds to add worker

docker rm -fv $(docker ps -aq)
docker volume prune

#all cluster with one node in host net
docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/rancher-agent:v2.4.2 --server https://rancher --token 2cpg649d6slmm5dqqtk6jxd4cphhx5lck7d49kgz8nw8zzwddwtjr6 --ca-checksum 0fd07b602c10365db9a4382436c2c919ee232538bf954b16ae8da8b0e1e1377c --etcd --controlplane
docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/rancher-agent:v2.4.2 --server https://rancher --token 2cpg649d6slmm5dqqtk6jxd4cphhx5lck7d49kgz8nw8zzwddwtjr6 --ca-checksum 0fd07b602c10365db9a4382436c2c919ee232538bf954b16ae8da8b0e1e1377c --worker
```