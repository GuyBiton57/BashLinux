#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' 
echo -e "${RED}your sentence:${NC} "
read setence
separed=$(echo "$setence" | sed -e 's:\(.\):\1 :g' | sed 's/=//g' )
ibase2='obase=16;ibase=2;'

function base32 {
	for i in $separed
	do
		if [ $i == "A" ];then
			i="0"
		elif [ $i == "B" ] ;then
			i="1"
		elif [ $i == "C" ] ;then
			i="2"
		elif [ $i == "D" ] ;then
			i="3"
		elif [ $i == "E" ] ;then
			i="4"
		elif [ $i == "F" ] ;then
			i="5"
		elif [ $i == "G" ] ;then
			i="6"
		elif [ $i == "H" ] ;then
			i="7"
		elif [ $i == "I" ] ;then
			i="8"
		elif [ $i == "J" ] ;then
			i="9"
		elif [ $i == "K" ] ;then
			i="10"
		elif [ $i == "L" ] ;then
			i="11"
		elif [ $i == "M" ] ;then
			i="12"
		elif [ $i == "N" ] ;then
			i="13"
		elif [ $i == "O" ] ;then
			i="14"
		elif [ $i == "P" ] ;then
			i="15"
		elif [ $i == "Q" ] ;then
			i="16"
		elif [ $i == "R" ] ;then
			i="17"
		elif [ $i == "S" ] ;then
			i="18"
		elif [ $i == "T" ] ;then
			i="19"
		elif [ $i == "U" ] ;then
			i="20"
		elif [ $i == "V" ] ;then
			i="21"
		elif [ $i == "W" ] ;then
			i="22"
		elif [ $i == "X" ] ;then
			i="23"
		elif [ $i == "Y" ] ;then
			i="24"
		elif [ $i == "Z" ] ;then
			i="25"
		elif [ $i == "2" ] ;then
			i="26"
		elif [ $i == "3" ] ;then
			i="27"
		elif [ $i == "4" ] ;then
			i="28"
		elif [ $i == "5" ] ;then
			i="29"
		elif [ $i == "6" ] ;then
			i="30"
		elif [ $i == "7" ] ;then
			i="31"
		fi
		echo $i
	done
}
base32=$(base32)

function bin {
	for i in $base32 
	do
		
		dec=$(echo "obase=2;$i" | bc)
		for g in $dec
		do
			echo "$g"
		done
	done
}
bin=$(bin)

function bin5 {
	for i in $bin
	do
		b=$(echo $i | wc -m)
			if [ $b -eq 2 ] ; then
				i="0000""$i"
			elif [ $b -eq 3 ] ; then
				i="000""$i"
			elif [ $b -eq 4 ] ; then
				i="00""$i"
			elif [ $b -eq 5 ] ; then
				i="0""$i"
			fi
		echo $i
	done
}

bin5=$(bin5)
bin8pre=$(echo $bin5 | sed 's/ //g')
bin8=$(echo $bin8pre | sed -e 's:\(.....\):\1 :g') 
check2=$(echo $setence | grep -o "=")
check2=$(echo $check2 | sed 's/ //g')
checkeq=$(echo $check2 | wc -m)

for i in $check2
do
	if [ $checkeq -eq "1" ];then
		break
	elif [ $check2 == "=" ];then
		check1=$(echo "${bin8pre::-1}")
		break
	elif [ $check2 == "==" ];then
		check1=$(echo "${bin8pre::-2}")
		break
	elif [ $check2 == "===" ];then
		check1=$(echo "${bin8pre::-3}")
		break
	elif [ $check2 == "====" ];then
		check1=$(echo "${bin8pre::-4}")
		break
	fi
done

check5=$(echo $check1 | sed -e 's:\(.......\):\1 :' | awk '{ print $2 }')
check2=$(echo $check1 | sed -e 's:\(.......\):\1 :' | awk '{ print $1 }')
check3=$(echo $check1 | sed -e 's:\(........\):\1 :g')
check4=$(echo "$check2 ""$check5")

for i in $check4
do
	hex+=$(echo "obase=16;ibase=2;$i" | bc | sed 's/\\//g')
done

bin2=$(echo "$ibase2 $check2" | bc | sed 's/\\//g')
bin=$(echo "$ibase2 $check1" | bc | sed 's/\\//g')
separedfinal=$(echo "$hex" | sed -e 's:\(..\):\1 :g' )
final=$(echo "$separedfinal" | hex2raw)
echo -e "${RED}hash:${NC} "
echo $final
