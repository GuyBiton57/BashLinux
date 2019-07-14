#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' 
echo -e "${RED}your sentence:${NC} "
ibase='ibase=16;obase=2;'

read setence
hex=$(echo "$setence" | hex2raw -r | sed 's/ //g' | sed 's/0A//g')
hexi=$(echo "$setence" | hex2raw -r )

#SHOWING HEX BEFOR
#echo -e "${RED}hex befor:${NC} "
bin=$(echo "$ibase $hex" | bc | sed 's/\\//g')
bina=$(echo -n $bin | sed 's/ //g')
bit8=$(echo "$bina" | sed -e 's:\(........\):\1 :g' )
int8=$(echo $bit8 | awk '{ print $NF }' | wc -m)
bit5=$(echo "$bina" | sed -e 's:\(.....\):\1 :g' )
int5=$(echo $bit5 | awk '{ print $NF }' | wc -m)
bit8f=$(echo $bit8n | sed 's/ //g')
## count the bits left
bitcount=$(echo $bit8n | wc -w )
bitcountg=$(expr $bitcount % 5)


if [ $int5 -eq 5 ];then
	addeq="="
elif [ $int5 -eq 4 ];then
	addeq="=="
elif [ $int5 -eq 3 ];then
	addeq="==="
elif [ $int5 -eq 2 ];then
	addeq="===="
fi


if [ $int5 -eq 2 ] ; then
	a="$bit5""0000"
elif [ $int5 -eq 3 ] ; then
	a="$bit5""000"
elif [ $int5 -eq 4 ] ; then
	a="$bit5""00"
elif [ $int5 -eq 5 ] ; then
	a="$bit5""0"
else 
	a=$bit5
fi
#SHOWING BINARY 5 BIT 
#echo -e "${RED}5bit:${NC} "
function decimal {
	for i in $a 
	do
		
		dec=$(echo "$((2#$i))")
		for g in $dec
		do
			echo "$g"
		done
	done
}

decii=$(decimal)
deciii=$(echo "$decii")

function base32 {
	for i in $decii
	do
		if [ $i -eq 0 ];then
			i="A"
		elif [ $i -eq 1 ] ;then
			i="B"
		elif [ $i -eq 2 ] ;then
			i="C"
		elif [ $i -eq 3 ] ;then
			i="D"
		elif [ $i -eq 4 ] ;then
			i="E"
		elif [ $i -eq 5 ] ;then
			i="F"
		elif [ $i -eq 6 ] ;then
			i="G"
		elif [ $i -eq 7 ] ;then
			i="H"
		elif [ $i -eq 8 ] ;then
			i="I"
		elif [ $i -eq 9 ] ;then
			i="J"
		elif [ $i -eq 10 ] ;then
			i="K"	
		elif [ $i -eq 11 ] ;then
			i="L"
		elif [ $i -eq 12 ] ;then
			i="M"
		elif [ $i -eq 13 ] ;then
			i="N"
		elif [ $i -eq 14 ] ;then
			i="O"
		elif [ $i -eq 15 ] ;then
			i="P"
		elif [ $i -eq 16 ] ;then
			i="Q"
		elif [ $i -eq 17 ] ;then
			i="R"
		elif [ $i -eq 18 ] ;then
			i="S"
		elif [ $i -eq 19 ] ;then
			i="T"
		elif [ $i -eq 20 ] ;then
			i="U"
		elif [ $i -eq 21 ] ;then
			i="V"
		elif [ $i -eq 22 ] ;then
			i="W"
		elif [ $i -eq 23 ] ;then
			i="X"
		elif [ $i -eq 24 ] ;then
			i="Y"
		elif [ $i -eq 25 ] ;then
			i="Z"
		elif [ $i -eq 26 ] ;then
			i="2"
		elif [ $i -eq 27 ] ;then
			i="3"
		elif [ $i -eq 28 ] ;then
			i="4"
		elif [ $i -eq 29 ] ;then
			i="5"
		elif [ $i -eq 30 ] ;then
			i="6"
		else i="7"
		fi
		echo $i
	done
}
base32final=$(base32)
echo -e "${RED}hash:${NC} "
echo $base32final$bit8n$addeq | sed 's/ //g'




