# Run all shell scripts in the current directory

# Get the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Show directory name
echo "Current directory: $DIR"

# SHOW ALL SHELL SCRIPTS IN THE CURRENT DIRECTORY
echo "Shell scripts in the current directory:"
find $DIR -type f -name "*.sh" -exec basename {} \;
break

count1=ls -1 *.sh 2>/dev/null | wc -l
for file in $DIR/*.sh
do
	echo "Running $file"
	$file
	count1=$((count1 + 1))
done

echo "Found $count11 shell scripts"


# RUN ALL SHELL SCRIPTS IN THE CURRENT DIRECTORY
echo "Running all shell scripts in the current directory:"
for	count1 in $DIR/*.sh
do
	echo "Running $count1"
	$count1
	count1=$((count1 + 1))

done

echo "Ran $count1 shell scripts"

if [ $count1 -eq 0 ]
then
	echo "No shell scripts found in the current directory"
fi


