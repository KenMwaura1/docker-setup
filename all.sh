# Run all shell scripts in the current directory

# Get the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Show directory name
echo "Current directory: $DIR"

# SHOW ALL SHELL SCRIPTS IN THE CURRENT DIRECTORY
echo "Shell scripts in the current directory:"
find $DIR -type f -name "*.sh" -exec basename {} \;

# Make all shell scripts in the current directory executable
echo "Making all shell scripts in the current directory executable:"
find $DIR -type f -name "*.sh" -exec chmod +x {} \;


# RUN ALL SHELL SCRIPTS IN THE CURRENT DIRECTORY
echo "Running all shell scripts in the current directory:"
find $DIR -type f -name "*.sh" -exec basename {} \; -exec sh {} \;

# kill running processes
echo "Killing running processes:"
ps -ef | grep -v grep | grep -i "docker" | awk '{print $2}' | xargs kill -9

# If container exists then skip creation
docker ps -a | grep -q "postgres" && echo "Container exists" || echo "Container does not exist"

# If container exists then skip creation
docker ps -a | grep -q "pgadmin4" && echo "Container exists" || echo "Container does not exist"

# If container exists then skip creation
docker ps -a | grep -q "redis" && echo "Container exists" || echo "Container does not exist"

# If container exists then skip creation
docker ps -a | grep -q "mongo-db" && echo "Container exists" || echo "Container does not exist"

# If container exists then skip creation
docker ps -a | grep -q "mysql" && echo "Container exists" || echo "Container does not exist"