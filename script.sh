#!/bin/bash

echo -n "Enter the number of droplet you want to create : "
read dropletcount

echo -n "Enter the name of droplet : "
read dropletname

echo -e "\nCurrent Supported data centerRegion : \n "
doctl compute region list
echo -e "\nEnter the Data center region from slug column :"
read region

echo -e "Current supported operating system vesion ( Default size: 2 CPU 4GB RAM ):\n  "
doctl compute image list-distribution

echo -e "\nEnter the Operating Systen Image from slug column : "
read osimage

echo -e "\nEnter the size of droplet : "
doctl compute size list |grep -v gpu|grep -i s- | grep -E 's-4|s-2|s-8|s-16'|grep -v Legacy
read size

for (( i = 1 ; i <= $dropletcount ; i++ ))
do
        doctl compute droplet create --region $region --image $osimage --size $size $dropletname$i
        sleep 5
done
