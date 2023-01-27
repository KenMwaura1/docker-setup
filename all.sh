# Run all shell scripts in the current directory

# Get the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Show directory name
echo "Current directory: $DIR"

# SHOW ALL SHELL SCRIPTS IN THE CURRENT DIRECTORY
echo "Shell scripts in the current directory:"
find $DIR -type f -name "*.sh" -exec basename {} \;


# RUN ALL SHELL SCRIPTS IN THE CURRENT DIRECTORY
echo "Running all shell scripts in the current directory:"
find $DIR -type f -name "*.sh" -exec basename {} \; -exec sh {} \;

# stop all the running containers
echo "Stopping all the running containers"
docker stop $(docker ps -a -q)

# Remove all the stopped containers
echo "Removing all the stopped containers"
docker rm $(docker ps -a -q)

# Remove all the images
echo "Removing all the images"
docker rmi $(docker images -q)

# Remove all the volumes
echo "Removing all the volumes"
docker volume rm $(docker volume ls -q)

# Remove all the networks
echo "Removing all the networks"
docker network rm $(docker network ls -q)

# Remove all the dangling images
echo "Removing all the dangling images"
docker rmi $(docker images -f "dangling=true" -q)

# Remove all the dangling volumes
echo "Removing all the dangling volumes"
docker volume rm $(docker volume ls -f "dangling=true" -q)

# Remove all the dangling networks
echo "Removing all the dangling networks"
docker network rm $(docker network ls -f "dangling=true" -q)

# Remove all the dangling containers
echo "Removing all the dangling containers"
docker rm $(docker ps -a -f "status=exited" -q)



