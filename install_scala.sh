# This script installs scala

# Removing old distribution
bash uninstall_scala.sh
echo
echo

# Load scala and unpack
echo "Loading scala distribution..."
wget -N http://www.scala-lang.org/downloads/distrib/files/scala-2.10.1.tgz \
	&& tar -xzf scala-2.10.1.tgz
echo "Done"
echo
echo

# Move scala and delete archive
echo "Moving scala distribution..."
sudo mv scala-2.10.1 /usr/share/scala

# Remove old scala package
rm -r scala-2.10.1.tgz
echo "Done"
echo
echo

# For all binaries in the scala folder
for scala_bin in $(ls /usr/share/scala/bin)
do
	# Read the first line to check if its
	# a valid bash script
	abs_scala_bin=/usr/share/scala/bin/$scala_bin
	
	# Load first line of scala bin
	echo "Investigating $abs_scala_bin"
	line=$(head -1 $abs_scala_bin)

	# Check for bash line
	if [[ "$line" == "#!/usr/bin/env bash" ]]
	then
		echo "Adding symbolic scala link for:"
		echo $abs_scala_bin
		sudo ln -s $abs_scala_bin /usr/bin/$scala_bin

	fi

	echo
	echo 
done

