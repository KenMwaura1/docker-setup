# Run all shell scripts in the current directory

# Get the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Show directory name
echo "Current directory: $DIR"

# SHOW ALL SHELL SCRIPTS IN THE CURRENT DIRECTORY
echo "Shell scripts in the current directory:"
scripts=`find $DIR -type f -name "*.sh" -exec basename {} \;`
for	file in $scripts
do
	echo "$file"
done
# Count the number of shell scripts in the current directory
count1=`find $DIR -type f -name "*.sh" -exec basename {} \; | wc -l`
c1=0
echo "Found $count1 shell scripts"


# RUN ALL SHELL SCRIPTS IN THE CURRENT DIRECTORY
echo "Running all shell scripts in the current directory:"
for	file in $scripts
do
	echo "Running $count1: $file"
	./$file
	c1=$((c1 + 1))
	break
	if [ $c1 -eq $count1 ]
	then
		echo "Ran all $count1 shell scripts"
		break
	fi
done


echo "Ran $count1 shell scripts"

if [ $count1 -eq 0 ]
then
	echo "No shell scripts found in the current directory"
fi


