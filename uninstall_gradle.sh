if [ -d "/usr/share/gradle" ]; then
	echo "Old gradle distribution found"
	
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
			# Check for existance
			if [ -f "/usr/bin/$gradle_bin" ]; then
				echo "Removing symbolic gradle link for:"
				echo $abs_gradle_bin

				sudo rm -f /usr/bin/$gradle_bin
			fi
		fi

		echo
		echo 
	done
	
	# Finally remove the gradle dist
	sudo rm -rf /usr/share/gradle
fi
