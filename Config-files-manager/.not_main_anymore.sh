#! /bin/bash

set -e

if [ -f $1 ]; then 
	echo -e "$1 exists.\n"
fi


#IFS='>>'  

#input="$1"

input="git_to_places.conf"

while read -r line
do

	read -a strarr <<< "$line"


	if [ "$1" == "togit" ]; then

		src="${strarr[0]}"

		des="${strarr[2]}"
	
	
		firstletter=${src:0:1}

		if [ ${src} == '#' ]; then
			echo -e "This line is commented out by - ${src}. Hence, Skipping.\n\t\"$line\""
			continue
		fi

		if [ $firstletter == "#" ]; then
			echo -e "This line is commented out by - "#"  Hence, Skipping.\n\t\"$line\""
			continue
		fi


	fi


	if [ "$1" == "fromgit" ]; then

		des="${strarr[0]}"

		src="${strarr[2]}"


		firstletter=${src:0:1}

		if [ ${src} == '#' ]; then
			echo -e "This line is commented out by - ${src}. Hence, Skipping.\n\t\"$line\""
			continue
		fi

		if [ $firstletter == "#" ]; then
			echo -e "This line is commented out by - "#"  Hence, Skipping.\n\t\"$line\""
			continue
		fi


	fi



	$(cp ${src} ${des})
	
	echo -e "Copied ${src} to ${des}\n"
	
done < "$input"



