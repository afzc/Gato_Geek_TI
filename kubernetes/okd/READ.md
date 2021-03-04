###OKD
DOCS:
https://docs.okd.io/3.11/welcome/index.html

Instalar docker community
https://docs.docker.com/install/linux/docker-ce/ubuntu/

Docker para todos los usuarios
https://docs.docker.com/install/linux/linux-postinstall/

Descargar minishift OKD
https://github.com/minishift/minishift/releases

Descargar OC
https://www.okd.io/download.html#oc-platforms

Instalar VirtualVox
https://www.virtualbox.org/wiki/Downloads
---
Variables de entorno:
```shell
sudo nano /etc/profile

export MN_HOME=/home/afzc/software/minishift-1.34.2-linux-amd64
export PATH=$PATH:$MN_HOME
export OC_HOME=/home/afzc/software/openshift-origin-client-tools-v3.11.0-$
export PATH=$PATH:$OC_HOME
```

Driver VultualBox minishift
https://docs.okd.io/3.11/minishift/getting-started/setting-up-virtualization-environment.html#setting-up-virtualbox-driver

START/STOP/DELETE
https://docs.okd.io/3.11/minishift/getting-started/quickstart.html#starting-minishift

PRIMER APP
https://docs.okd.io/3.11/minishift/getting-started/quickstart.html#deploy-sample-app

DOCKER-ENV
https://docs.okd.io/3.11/minishift/using/docker-daemon.html

DOCKER-REGISTRY
https://docs.okd.io/3.11/minishift/openshift/openshift-docker-registry.html

PUSH IMG
https://medium.com/@adilsonbna/importing-an-external-docker-image-into-red-hat-openshift-repository-c25894cd3199

```shell
#docker save -o <NAME> <IMG>/<ID>
oc login
minishift docker-env
eval $(minishift docker-env)
docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)
#docker load -i <NAME>
#$ sudo docker tag <idimage> $(minishift openshift registry)/afzc-dev/<name>:<tag>
#$ sudo docker push $(minishift openshift registry)/afzc-dev/<name>:<tag>
```

