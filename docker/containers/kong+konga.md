##kong + konga
```shell
docker network create kong-net

docker run -d --name kong-database \
               --network=kong-net \
               -p 9042:9042 \
               cassandra:3.11.6

#esperar a que levante cassandra

docker run --rm \
     --network=kong-net \
     -e "KONG_DATABASE=cassandra" \
     -e "KONG_PG_HOST=kong-database" \
     -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
     kong:1.5.1 kong migrations bootstrap

docker run -d --name kong \
     --network=kong-net \
     -e "KONG_DATABASE=cassandra" \
     -e "KONG_PG_HOST=kong-database" \
     -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
     -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
     -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
     -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
     -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
     -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
     -p 8000:8000 \
     -p 8443:8443 \
     -p 8001:8001 \
     -p 8444:8444 \
     kong:1.5.1

docker run -d -p 1337:1337 \
	     --network=kong-net \
             --link kong:1.5.1 \
             --name konga \
             -e "NODE_ENV=production" \
             pantsel/konga
```