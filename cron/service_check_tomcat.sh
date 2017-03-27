#!/bin/bash
service=tomcat
time="$(date)"

if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
echo "$time $service is running!!!"
else
/etc/init.d/$service start
fi