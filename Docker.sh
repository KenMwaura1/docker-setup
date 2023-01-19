docker network create --driver bridge pgnetwork

docker run --publish 5050:5050 \
             --volume=pgadmin4:/var/lib/pgadmin \
             --env-file=pgadmin-env.list \
             --name="pgadmin4" \
             --hostname="pgadmin4" \
             --network="pgnetwork" \
             --detach \
           registry.developers.crunchydata.com/crunchydata/crunchy-pgadmin4:centos8-13.6-4.7.5

docker run --publish 5432:5432 \
             --volume=postgres:/pgdata \
             --env-file=pg-env.list \
             --name="postgres" \
             --hostname="postgres" \
             --network="pgnetwork" \
             --detach \
           registry.developers.crunchydata.com/crunchydata/crunchy-postgres:centos8-13.6-4.7.5

docker run -p 9090:9090 prom/prometheus

docker run -d -p 3000:3000 grafana/grafana-oss

