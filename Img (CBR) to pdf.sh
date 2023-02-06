#! /bin/bash

if [ ! -d "../PDF" ]; then
    mkdir "../PDF"
elif [[ $1 == 'f' ]]; then
    echo Override Accepted!
else
    echo "A 'PDF' folder already exists in parent directory. Add 'f' as argument to override!"
    exit
fi

OIFS="$IFS"
IFS=$'\n'

for dir in $(find * -maxdepth 0 -type d); do
    count_JP=`ls -1 $dir/*.jp* 2>/dev/null | wc -l`
    count_PNG=`ls -1 $dir/*.png 2>/dev/null | wc -l`
    if [[ $count_JP != 0 && $count_PNG != 0 ]]; then
        echo -e "\nSomething is wrong!!!\nCheck $dir\nJPG=$count_JP\tPNG=$count_PNG\nno. of sub-directories in $dir=$(find $dir/* -maxdepth 0 -type d | wc -l)"
        echo -e "\nDiagnosis:\tBOTH JPG and PNG files exist in \" $dir \""
        break
    elif [[ $count_JP != 0 && $count_PNG == 0 ]]; then
#            img2pdf ./"$f"/*.jp* --output ../PDF/"$f".pdf
        find ./$dir/ -name '*.jp*' -print0 | sort -z -V | xargs -0r img2pdf -s 1080x2400 --fit into -o ../PDF/"$dir".pdf
#         find ./$dir/ -name '*.jp*' -print0 | sort -z -V | xargs -0r img2pdf -o ../PDF/"$dir".pdf
        echo -e "JPG/JPEG:\tDIR = $dir \t Completed"
    elif [[ $count_PNG != 0 && $count_JP == 0 ]]; then
#            img2pdf ./"$f"/*.png --output ../PDF/"$f".pdf
        find ./$dir/ -name '*.png' -print0 | sort -z -V | xargs -0r img2pdf -s 1080x2400 --fit into -o ../PDF/"$dir".pdf
#         find ./$dir/ -name '*.png' -print0 | sort -z -V | xargs -0r img2pdf -o ../PDF/"$dir".pdf
        echo -e "PNG:\tDIR = $dir \t Completed"
    else
        echo -e "The directory \" $dir \" is empty!\nYou may need to check the name of directory. '[]' is not allowed."
        if [[ $1 == 'F' ]]; then
            echo -e "\nLoop override set! Proceeding to next directory!"
        else
            echo set '$1'=F to Override Loop!
            break
        fi
    fi
    echo -e "No. of JPG/JPEG files\t$count_JP\nNo. of PNG files\t$count_PNG\n"
done

IFS="$OIFS"
# img2pdf ./*.jpg -s 1080x2400 --fit into -o out.pdf
# --rotation=ifvalid

########################### README ########################
# Dependencies:
#   |> img2pdf

# Usage:
# Copy this file to the parent directory of the directory in which reside JPEG/JPG or PNG files.
# Run this script

# It will create a folder named PDF in the parent directory of $PWD if it doesn't already exist
# And it will place all converted pdfs in this folder, with the names of the respective folders
# The output will notify exactly how many folders have JPG files and how many have PNG files

# Demo:
#   Before:

#  /                    (Parent Directory)
# -> Comics             ($PWD)
#   |-> CBR_to_PDF.sh   (Script must be placed at this exact position)
#   |-> SPIDERMAN
#       |-> Spider1.jpg
#       |-> Spider2.jpg
#   |-> BATMAN
#       |-> BAT1.jpg
#       |-> BAT2.jpg

#   After:

#  /                    (Parent Directory)
# -> PDF                (New Folder containing PDFs)
#   |->SPIDERMAN.pdf
#   |->BATMAN.pdf
# -> Comics             ($PWD)
#   |-> CBR_to_PDF.sh   (Script)
#   |-> SPIDERMAN
#       |-> Spider1.jpg
#       |-> Spider2.jpg
#   |-> BATMAN
#       |-> BAT1.jpg
#       |-> BAT2.jpg

# Known Edge Cases:
#   |> If the one or more folders contain JPGs ond PNGs together.
#   |> Names of the folders must be free of [] square brackets. Why? I don't know...
#   |> Fortunately, it leaves the previously exiting ../PDF folder and its contents intact if there are no file conflicts...

# Improvements to be expected:
#   |> Ability to extract .CB* ( .CBR, .CBZ, .CBT ) files and then create pdfs
#   |> Support for more file formats
#   |> Ability to handle Arguments ($PWD, etc.,) and Options both in command-line and in GUI
#   |> A GUI for this appication.
#   |> Manga Support (Reverse Page Order)

# Use the font "JetBrains Mono" to view the ligatures: |>  ->  |->
