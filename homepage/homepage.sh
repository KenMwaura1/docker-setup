docker run --name homepage \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 1738:3000 \
  -v ./config:/app/config \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --restart unless-stopped \
  ghcr.io/benphelps/homepage:latest
