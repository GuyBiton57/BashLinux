#!/bin/bash	

#Ask the user on wich file he want to search
read -p "Hello, please input the file name:" filename
	filee=$(ls | grep $filename | wc -l)
	if [ $filee = 1 ];then 
		echo "ok"
	elif [ $filee -gt 1 ] && [ $filee -lt 1000 ];then
	echo "$(ls | grep $filename)"
	read -p "please choose file:" filename
	else  echo "this file doesnt exist try again."
	exit
	fi
#Ask the user choos a letter 
#if there are more then 10 words make a file named success
while true;do
	read -p "please choose a letter you want to verify:" letter

	succesi=$(grep -o "\b$letter\w*" $filename | wc -l |awk '{print $1}')
	showletter=$(grep -o "\b$letter\w*" $filename)
	if [ $succesi == 0 ];then
		echo "try again this letter not exist"
	elif [ $succesi -ge 10 ] && [[ $(echo $letter | wc -m) -ge 2 ]] ; then
		grep -o "\b$letter\w*" $filename > Success
		echo "Your letter have more then 10 words."
		echo "Making file for you wich contain the words."
		echo "file name Success was created"
		readlink -f Success
		break
#show the user how many words start with hes letter 
	elif [ $succesi -lt 10 ] && [ $succesi -gt 0 ] ; then
		echo $showletter
		break
	else 
			echo "try again this letter not exist"
	fi
done
echo "Done"
