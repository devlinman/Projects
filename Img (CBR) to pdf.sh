#! /bin/bash

if [ ! -d "../PDF" ]; then
    mkdir "../PDF"
fi

for f in *; do
    if [ -d "$f" ]; then
        count_JP=`ls -1 $f/*.jp* 2>/dev/null | wc -l`
        count_PNG=`ls -1 $f/*.png 2>/dev/null | wc -l`
        if [ $count_JP != 0 ]; then
            img2pdf ./"$f"/*.jp* --output ../PDF/"$f".pdf
            echo -e "JPG/JPEG:\tDIR = $f \t Completed"
        elif [ $count_PNG != 0 ]; then
            img2pdf ./"$f"/*.png --output ../PDF/"$f".pdf
            echo -e "PNG:\tDIR = $f \t Completed"
        else
            echo -e "Something is wrong!!!\nCheck $f"
            break
        fi
    fi
done

echo -e "No. of JPG/JPEG files\t$count_JP\nNo. of PNG files\t$count_PNG\n"

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

# Improvements to be expected:
#   |> If a folder contains JPGs and PNGs mixed together: Throw Error.
#     Implementation: A simple check to see if both $count_JP and $count_PNG are non-zero at the same time.
#   |> Ability to extract .CB* ( .CBR, .CBZ, .CBT ) files and then create pdfs
#   |> Support for more file formats
#   |> Ability to handle Arguments ($PWD, etc.,) and Options both in command-line and in GUI
#   |> A GUI for this appication.
#   |> Manga Support (Reverse Page Order)

# Use the font "JetBrains Mono" to view the ligatures: |>  ->  |->
