pamacInstall=$(sed -n '/#/d;/pamax {/,/}/{//!p}' Packages.py)
echo -e "\nInstalling:"
echo $pamacInstall
# pamac install --no-confirm $pamacInstall

pamacRemove=$(sed -n '/#/d;/pamar {/,/}/{//!p}' Packages.py)
echo -e "\nRemoving:"
echo $pamacRemove
# pamac remove --no-confirm $pamacRemove

if [[ $1 == "I" ]];
then
    echo -e "\n\tOnly Install Packages!\n"
    pamac install --no-confirm $pamacInstall

elif [[ $1 == "R" ]];
then
    echo -e "\n\tOnly Remove Packages!\n"
    pamac remove --no-confirm $pamacRemove

elif [[ $1 == "T" ]];
then
    echo -e "\n\tTHIS IS A TEST!\n\n\tTesting....\n\n\texit()"
    exit

else
    echo -e "\nBoth Install and Remove Packages\n"
    pamac remove --no-confirm $pamacRemove
    pamac install --no-confirm $pamacInstall
fi


# awk -F"[{}]" '/pid/ { print $4 }' inputfile
# #
# # while read -r line
# # do
# #     bash "$line"
# # #     echo $line
# #
# # # done < commands.cmd
# #
# # done < c.txt
