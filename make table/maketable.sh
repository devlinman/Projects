#! /bin/python

import subprocess as sp
# kdialog --inputbox "Enter Title:" $var $title

# ruby ./ascii_table/ascii_table.rb <<< 'set_title $title'

# ruby ./ascii_table/ascii_table.rb <<< "set_headings col1 col2 col3"

# ruby ./ascii_table/ascii_table.rb <<< 'set_headings col1 col2 col3'

# ruby ./ascii_table/ascii_table.rb <<< 'add hello ther man!'

# ruby ./ascii_table/ascii_table.rb <<< 'add hello there man!' <<< 'save output.txt'

sp.Popen('ruby ./ascii_table/ascii_table.rb \<<< "set_title hello" <<< "table"', shell=True)

# echo $t
# <<< 'set_headings col1 col2 col3' <<< 'add hello there man' <<< 'save out.txt'
