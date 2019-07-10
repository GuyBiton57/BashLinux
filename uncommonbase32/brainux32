
#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' 
echo -e "${RED}your sentence:${NC} "
ibase='ibase=16;obase=2;'
ibase2='obase=16;ibase=2;'
read setence
hex=$(echo "$setence" | hex2raw -r | sed 's/ //g' | sed 's/0A//g')
hexi=$(echo "$setence" | hex2raw -r )
#SHOWING HEX BEFOR
#echo -e "${RED}hex befor:${NC} "
#echo $hexi
bin=$(echo "$ibase $hex" | bc | sed 's/\\//g')
bina=$(echo -n $bin | sed 's/ //g')
base32=$(echo "$bina" |sed -e 's:\(.....\):\1 :g' )
int=$(echo $base32 | awk '{ print $NF }' | wc -m)

if [ $int -eq 2 ] ; then
	a="$base32""0000"
elif [ $int -eq 3 ] ; then
	a="$base32""000"
elif [ $int -eq 4 ] ; then
	a="$base32""00"
elif [ $int -eq 5 ] ; then
	a="$base32""0"
fi
#SHOWING BINARY 5 BIT 
#echo -e "${RED}5bit:${NC} "
#echo $a
function decimal {
	for i in $a 
	do
		dec=$(echo "$((2#$i))")
		for g in $dec
		do
			deci=$(echo $g | wc -m )
			if [ $deci -eq 3 ]; then
				resulta=${dec//[12]/8}
				echo $resulta
			fi
			if [ $deci -eq 2 ]; then
				resultb=${dec//$g/6$g}
				echo $resultb
			fi
		done
	done
}


decii=$(decimal)
hex=$(echo "obase=16;$decii"| bc)
#SHOWING HEX AFTER
#echo -e "${RED}hex:${NC} "
#echo $hex
hash=$(echo $hex | hex2raw)
echo -e "${RED}hash:${NC} "
echo $hash
