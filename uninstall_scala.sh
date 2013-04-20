if [ -d "/usr/share/scala" ]; then
	echo "Old scala distribution found"
	
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
			# Check for existance
			if [ -f "/usr/bin/$scala_bin" ]; then
				echo "Removing symbolic scala link for:"
				echo $abs_scala_bin

				sudo rm -f /usr/bin/$scala_bin
			fi
		fi

		echo
		echo 
	done
	
	# Finally remove the scala dist
	sudo rm -rf /usr/share/scala
fi
