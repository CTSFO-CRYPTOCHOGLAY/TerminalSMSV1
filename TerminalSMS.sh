#!/bin/bash
functionPath="$(pwd)"
. $functionPath/main_texting.sh

banner () {	                        
	echo -e "" \     "\t\t\t\t  ______                    _             _______ __  ________ \n" \
                         "\t\t\t\t /_  __/__  _________ ___  (_)___  ____ _/ / ___//  |/  / ___/ \n" \
                         "\t\t\t\t   / / / _ \/ ___/ __ __ \/ / __ \/ __ / /\__ \/ /|_/ /\__ \   \n" \
                         "\t\t\t\t  / / /  __/ /  / / / / / / / / / / /_/ / /___/ / /  / /___/ / \n" \
                         "\t\t\t\t /_/  \___/_/  /_/ /_/ /_/_/_/ /_/\__,_/_//____/_/  /_//____/  \n" \
			 "\t\t\t\t by Mohammed Choglay                                           \n" \
			 ""
  		}

	 
help_menu () {
		 echo -e "\n"
	         echo -e "\t\t\t\t LEGAL NOTICE: YOU ARE HELD RESPONSIBLE FOR YOUR OWN ACTIONS." 
		 echo -e "\t\t\t\t IF THE TOOL IS MISSSED USED YOU COULD FACE CRIMINAL CHARGES"
                 echo -e "\t\t\t\t AND I WILL NOT BE HELD RESPONSIBLE FOR YOUR ACTIONS." 
	         echo -e "\n"
		 echo -e "\t\t\t\t===========================Options========================="
		 echo -e "\t\t\t\t -b | --balance Allow you to check the mount of message you have left"
		 echo -e "\t\t\t\t -c | --check Allows to check the status of your messages"
		 echo -e "\t\t\t\t -f | --file Allows you to read numbers from a .txt file"
                 echo -e "\t\t\t\t -s | --START This will start them main TerminalSMS function"
	 }

usersOption=$1

if [[ "$usersOption" == "-h" || "$usersOption" == "--help" ]]; then 
	banner
	help_menu
elif [[ "$#" -lt 1 ]]; then
	banner
	echo "Sytax Error: Use --help or -h for help. e.g 'TerminalSMS -h' "
else 
	if [[ "$usersOption" == "-f" || "$usersOption" == "--file" ]]; then
		readFromFile $2
	elif [[ "$usersOption" == "-s" || "$usersOption" ==  "--start" ]]; then
		main
	elif [[ "$usersOption" == "-c" || "$usersOption" == "--check" ]]; then 
		statusCheck 
	elif [[ "$usersOption" == "-b" || "$usersOption" == "--balance" ]]; then 
		creditCheck
	fi
fi
