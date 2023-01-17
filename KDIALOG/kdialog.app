#! /bin/bash
input="conf.conf"

##===============<FUNCTIONS>========================

showfunction () {
	kdialog --msgbox "$(cat $input)"
}

modifyfunction () {

# 	kdialog --separate-output --checklist "Select Files:" 1 "One" off 2  "Two" off 3 "Vecna" off
# 	sed -i '$ln i # $line' $input
	i=1
	Entries=""
	for i in "${alllines[@]}"
	do
		Entries=$Entries\ $i\ ${alllines[$i]}\ off\
	done
	kdialog --separate-output --checklist "Select Entries:" $Entries
}

uncommentedlinesfunction () {
i=0
c=0
declare -a uncommentedlinenumbers
while read -r line
do
    let "i=i+1"
    firstletter=${line:0:1}
    if [ "$firstletter" == "#" ]; then
        continue
    else
        uncommentedlinenumbers[$c]="$i"
        let "c=c+1"
    fi
done < "$input"
# kdialog --msgbox "${uncommentedlinenumbers[*]}"
}

alllinesfunction () {
	i=0
	declare -a alllines
	while read -r line
	do
		alllines[i]="$line"
		let "i=i+1"
	done < "$input"
}

copyfunction () {

	while read -r line
	do

		read -a strarr <<< "$line"


	done < "$input"

}

##=================</FUNCTIONS>====================
alllinesfunction
modifyfunction


#
# if [ -f $input ]; then
# 	kdialog --msgbox "Configuration File exists"
# else
# 	kdialog --msgbox "Configuration file doesn't exist!\n\nChoose file..."
# 	input=$(kdialog --getopenfilename)
# fi
#
# kdialog --yesno "Do you want to view entries?"
# ansviewentries=$?
#
# kdialog --yesno "Do you want to select specific entries in the Configuration file?"
# ansselectentries=$?
#
# if [ $ansviewentries == 0 ]; then
# 	showfunction
# fi
# if [ $ansselectentries == 0 ]; then
# 	modifyfunction
# fi
#
# kdialog --yesnocancel "Which way?" --yes-label "From Git repo" --no-label "To Git Repo"
# ansgit=$?
#
# if [ $ansgit == 0 ]; then
# 	copyfunction "from git repo"
# 	kdialog --msgbox "Copied from Git Repo to root"
# elif [ $ansgit == 1 ]; then
# 	copyfunction "to git repo"
# 	kdialog --msgbox "Copied from root to Git Repo"
# else
# 	kdialog --msgbox "Exiting"
# 	exit
# fi




#
# if [ $ansgit == 0 ]; then
# 	copyfunction "from git repo"
# 	kdialog --msgbox "Copied from Git Repo to root"
# elif [ $ansgit == 1 ]; then
# 	copyfunction "to git repo"
# 	kdialog --msgbox "Copied from root to Git Repo"
# else
# 	kdialog --msgbox "Exiting"
# 	exit
# fi

# 	if [ "$?" = 0 ]; then
#         input=$(kdialog --getopenfilename)
#     else
#         exit
#     fi

