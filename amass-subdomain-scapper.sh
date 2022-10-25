#!/bin/bash

url=$1

if [ ! -d "$url" ];then
	 mkdir $url
fi

if [ ! -d "$url/report" ];then
	 mkdir $url/report
fi

echo "[+] Harvesting subdomains using amass"
amass enum -d $url >> $url/report/report.txt
sort  $url/report/report.txt | grep $1 >> $url/report/final.txt
rm $url/report/report.txt