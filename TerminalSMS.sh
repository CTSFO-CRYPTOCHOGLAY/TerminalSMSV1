#!/bin/bash 
#echo "Devloped by mohammed choglay"
apiKey=
number=
message=
comp=
time=0 

main(){
echo "[!]Enter Number On Target:"
read number

echo "[!]Enter Message For Target:"
read message

echo "[!]Would you like to add timer? (Y/N)"
read comp
if [[ "$comp" == "Y" ]] || [[ "$comp" == "y" ]]; then
echo "[!]Enter the amount of seconds required"	
read time 
elif [[ "$comp" == "N" ]] || [[ "$comp" == "n" ]]; then
	:
fi

echo "==============================="

echo "[!]Locking On Traget:" $number
echo "[!]Message To Be Transmitted:" $message
echo "[!]Timer Set For:" $time

echo "[!]DO YOU WISH TO PROCCED WITH TRANSMISSION? (Y/N)"
read comp
if [[ "$comp" == "Y" ]] || [[ "$comp" == "y" ]]; then  
  sleep $time
     curl -X POST https://textbelt.com/text \
     --data-urlencode phone="$number" \
     --data-urlencode message="$message" \
     -d key="$apiKey"
elif [[ "$comp" == "N" ]] || [[ "$comp" == "n" ]]; then
   echo "[!] Session Terminated! "
fi
}

readFromFile(){
fileName=$1

echo "[!] Reading numbers from $fileName list"
echo "[!] Enter a message that you want to send to $fileName list"
read message 

echo "Would you like to add a timer (Y/N)"
read comp
if [[ "$comp" == "Y" ]] || [[ "$comp" == "y" ]]; then 
echo "[!]Enter the amount of seconds required"
read time
elif [[ "$comp" == "N" ]] || [[ "$comp" == "n" ]]; then
	:
fi

echo "==========================================================="

echo "[!]Locking On Targets From: $fileName"
echo "[!]Message To Be Transmiited: $message"
echo "[!]Timer Set To: $time seconds"

echo "[!] DO YOU WISH TO PROCCED WITH TRANSMISSION? (Y/N)"
read comp
if [[ "$comp" == "Y" ]] || [[ "$comp" == "y" ]]; then
       sleep $time 
	while read line; do
		curl -X POST https://textbelt.com/text \
		--data-urlencode phone="$line" \
		--data-urlencode message="$message" \
		-d key="$apiKey"
	done < ${fileName}
elif [[ "$comp" == "N" ]] || [[ "$comp" == "n" ]]; then 
	echo "[!] Session Terminated!"
fi
}

statusCheck(){
echo "[!]Enter your textID for delivery status:"
read textID
curl https://textbelt.com/status/$textID
}

creditCheck(){ 
echo "[!]Checking your credits:"
curl https://textbelt.com/quota/$apiKey
}
