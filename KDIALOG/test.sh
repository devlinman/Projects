#! /bin/bash
input="conf.conf"

declare -a alllines

alllinesfunction () {
	i=0
	while read -r line
	do
		alllines[i]="$line"
# 		echo -e "$i ${alllines[i]}\n"
		let "i=i+1"
	done < "$input"
}

modifyfunction () {
	local i=1
	Entries=""
	for j in "${alllines[@]}"
	do
        echo ${alllines[j]}
		Entries="$Entries\ $i\ \"${alllines[$j]}\"\ off\ "
		let "i=i+1"
		let "j=j+1"
	done
    echo $Entries
}



alllinesfunction
# modifyfunction


#
# var1="hello"
# var2="world"
# var3="!"
# message=$var1\ $var2$var3
# echo $message
# #
# # i=0
# # c=0
# # declare -a uncommentedlinenumbers
# #
# # while read -r line
# # do
# #
# #     let "i=i+1"
# #     firstletter=${line:0:1}
# #
# # #     kdialog --msgbox "$line\n\nfirstletter=${line:0:1}"
# #
# #     if [ "$firstletter" == "#" ]; then
# #         continue
# # #     elif [ "$firstletter" == "R" ]; then
# # #         continue
# #     else
# #         uncommentedlinenumbers[$c]="$i"
# #         let "c=c+1"
# #     fi
# #
# # done < "$input"
# #
# # kdialog --msgbox "${uncommentedlinenumbers[*]}"
