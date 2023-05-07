docker run -d \
  --name=homeassistant \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 8123:8123 `#optional` \
  -v /path/to/data:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/homeassistant:latest
