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

