#!/bin/bash

read -p "send or get?:" sog
read -p "on port?:" port
read -p "filename?:" filename

if [ $sog = "send" ]; then
	nc -lvp $port -q 5 <$filename
elif [ $sog = "get" ]; then
	read -p "wich ip?:" ip
	nc -v $ip $port -q 5 >$filename
else echo "sintax error" 
fi
#!/bin/bash
exit 

