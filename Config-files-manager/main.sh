#! /bin/bash

set -e

input="git_to_places.conf"


if [ -f $input ]; then
	echo -e "$input exists.\n"
fi


while read -r line
do

	read -a strarr <<< "$line"


	if [ "$1" == "fromgit" ]; then

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
# 		echo -e "$line\n\n\tsrc = $src\t des = $des\t firstletter = $firstletter\n"


	elif [ "$1" == "togit" ]; then

		des="${strarr[0]}"

		src="${strarr[2]}"


		firstletter=${des:0:1}

		if [ ${des} == '#' ]; then
			echo -e "This line is commented out by - ${src}. Hence, Skipping.\n\t\"$line\""
			continue
		fi

		if [ $firstletter == "#" ]; then
			echo -e "This line is commented out by - "#"  Hence, Skipping.\n\t\"$line\""
			continue
		fi
# 		echo -e "$line\n\n\tsrc = $src\t des = $des\t firstletter = $firstletter\n"


	else
		echo "Enter a valid argument."
		break
	fi



	$(cp ${src} ${des})
	
	echo -e "Copied ${src} to ${des}\n"

	#echo -e "$line \n	$src --->> $des"
	
done < "$input"



