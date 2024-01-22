# Run all shell scripts in the current directory

# Get the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Show directory name
echo "Current directory: $DIR"

# Find all shell scripts in the current directory
scripts=$(find $DIR -type f -name "*.sh")
# Convert the list of scripts into an array
script_array=($scripts)

# Show all shell scripts in the current directory
echo "Shell scripts in the current directory:"
for file in "${script_array[@]}"
do
    echo "$file"
done

# Count the number of shell scripts in the current directory
count1=${#script_array[@]}
echo "Found $count1 shell scripts"

# Run all shell scripts in the current directory
echo "Running all shell scripts in the current directory:"
c1=0
for file in "${script_array[@]}"
do
    echo "Running script $((c1+1)): $file"
    chmod +x "$file"
    "$file"
    if [ $? -eq 0 ]; then
        c1=$((c1 + 1))
    fi
    echo $c1
    if [[ $c1 -eq 9 ]]
    then
        echo "Ran all $c1 shell scripts"
        break
    fi
done

echo "Ran $c1 shell scripts"

if [ $count1 -eq 0 ]
then
    echo "No shell scripts found in the current directory"
fi