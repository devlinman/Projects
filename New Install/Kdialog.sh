#! /bin/bash

function answerOrExit () {
    [ "$1" = 0 ] && eval $2
    [ "$1" = 1 ] && eval $3
}

kdialog --msgbox "Hello there! Let's Install some packages!"
input=Packages.txt
# input=Not_Packages.txt

if [ ! -f $input ]; then
    kdialog --yesno "Configuration file doesn't exist!\n\nChoose Configuration File?"
    answerOrExit "$?" 'input=$(kdialog --getopenfilename)' "exit"
#     echo $input
else
    kdialog --msgbox "Configuration File exists"
fi

kdialog --yesno "Do you want to view the config file?"
answerOrExit "$?" "kdialog --textbox $(printf %q "$input")" ""
pamacInstall=$(sed -n '/#/d;/pamax {/,/}/{//!p}' Packages.py)
pamacRemove=$(sed -n '/#/d;/pamar {/,/}/{//!p}' Packages.py)

Listify () {
    Entries=$@
    entryArray=($Entries)
    for i in ${!entryArray[@]}
    do
        ans=$ans' '$(($i+1))' '\"${entryArray[$i]}\"' 'off
    done
    echo $ans
}

installOrRemove () {
    indices=(${@:2})
    [ "$1" = 'I' ] && Array=($pamacInstall)

    [ "$1" = 'R' ] && Array=($pamacRemove)

    Final=()
    for i in ${indices[@]}
    do
        Final+=(${Array[$(($i-1))]})
    done

    [ "$1" = 'I' ] && pamac install ${Final[*]}
    [ "$1" = 'R' ] && pamac remove ${Final[*]}

#     echo final: ${Final[*]}
}

selectEntries () {

    pamacInstallList=$(Listify $pamacInstall)
    pamacRemoveList=$(Listify $pamacRemove)

    choice=$(kdialog --checklist "Select Packages to Install" $pamacInstallList | xargs)
    [ -z "$choice" ] || installOrRemove 'I' $choice

    choice=$(kdialog --checklist "Select Packages to Remove" $pamacRemoveList | xargs)
    [ -z "$choice" ] || installOrRemove 'R' $choice

    [ "$?" = 0 ] && [ "$status" = 0 ] && kdialog --msgbox "Transaction Successful"
    [ "$?" != 0 ] || [ "$status" != 0 ] || kdialog --msgbox "Transaction Failed. Inconvinience is regretted!"
    exit
}

bothIAndR () {
    pamac install --no-confirm $pamacInstall
    pamac remove --no-confirm $pamacRemove
    exit
}

kdialog --yesno "Do you want to select specific entries in the Configuration file?"
answerOrExit "$?" "selectEntries" ""

kdialog --yesno "Are you sure you want to install and remove all packages as listed in the Configuration file?"
answerOrExit "$?" "bothIAndR" "kdialog --msgbox 'Sorry for the Inconvinience'"
[ "$?" = 0 ] && exit
