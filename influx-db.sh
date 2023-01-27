# command for starting up local influxdb container
docker run -d -p 8086:8086 -v influxdb:/var/lib/influxdb influxdb --name influxdb
