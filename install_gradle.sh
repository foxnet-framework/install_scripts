# This script installs gradle

# Removing old distribution
bash uninstall_gradle.sh
echo
echo

# Load gradle and unpack
echo "Loading gradle distribution..."
wget -N http://services.gradle.org/distributions/gradle-1.5-bin.zip \
	&& unzip gradle-1.5-bin.zip
echo "Done"
echo
echo

# Move gradle and delete archive
echo "Moving gradle distribution..."
sudo mv gradle-1.5 /usr/share/gradle

# Remove old gradle package
rm -r gradle-1.5-bin.zip
echo "Done"
echo
echo

# For all binaries in the gradle folder
for gradle_bin in $(ls /usr/share/gradle/bin)
do
	# Read the first line to check if its
	# a valid bash script
	abs_gradle_bin=/usr/share/gradle/bin/$gradle_bin
	
	# Load first line of gradle bin
	echo "Investigating $abs_gradle_bin"
	line=$(head -1 $abs_gradle_bin)

	# Check for bash line
	if [[ "$line" == "#!/usr/bin/env bash" ]]
	then
		echo "Adding symbolic gradle link for:"
		echo $abs_gradle_bin
		sudo ln -s $abs_gradle_bin /usr/bin/$gradle_bin

	fi

	echo
	echo 
done

