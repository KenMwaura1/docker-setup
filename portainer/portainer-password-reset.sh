# This script will reset the admin password for Portainer

docker container stop portainer

docker run --rm -v portainer_data:/data portainer/helper-reset-password

# Finally, start Portainer again

docker container start portainer
