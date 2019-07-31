#!/bin/bash

#v1.2
#this tool are made to block or unblock a ip address from kali linux firewall.
#if you want to block put the ip after calling the script
#block the ip on iptables or unblock
#use -u flag to unblock and then in the $2 argument put the ip 
#feel free to comment and add this script as many as you want.
#BrainuxBashTools
#-------------------------------------------------------------------------

arguments=$#
if [ $arguments -ge 1 ];then 
	if [ $1 == "-u" ];then
		ip=$2
		checkip=$(iptables -L  | grep -o $ip | wc -w)
		if [ $checkip -le 2 ];then
			numberip=$(iptables -L --line-number | grep $ip |awk '{ print $1}')
			numberip=$(echo $numberip | awk '{ print $1}')
			iptables -D INPUT $numberip 
			numberip=$(iptables -L --line-number | grep $ip |awk '{ print $1}')
			numberip=$(echo $numberip | awk '{ print $1}')
			iptables -D OUTPUT $numberip 
		else echo "too much ips contain the same ip. abort."
		   	exit
		fi
	else
		iptables -A INPUT -s $1 -j DROP
		iptables -A OUTPUT -s $1 -j DROP
	fi
else echo "bad argument please follow the syntax"
fi
