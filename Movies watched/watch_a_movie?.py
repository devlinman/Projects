#! /bin/python

import os
#import sys
# sys.argv[0]
x = os.system('kdialog --yesno "Did you watch a movie just then?"')

if x != 0:
    os.system('kdialog --msgbox "bye"')
else:
    Title=os.system('kdialog --textinputbox "Movie Title"')

f = open("output.txt", "a")
print(Title, file=f)
f.close()

