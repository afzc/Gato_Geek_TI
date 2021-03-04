apt update && \
    apt install curl -y
curl -sSLf http://k0s.sh | sh
k0s default-config > k0s.yaml
#docker cp <name>/<id>:/k0s.yaml .
#docker cp k0s.yaml <name>/<id>:/k0s.yaml
k0s server -c k0s.yaml #&
#k0s server --enable-worker &
#cp /var/lib/k0s/pki/admin.conf admin.conf
#docker cp <name>/<id>:/admin.conf .
#docker cp k0s.yaml <name>/<id>:/k0s.yaml

#k0s token create --role=worker