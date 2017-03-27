#!/bin/bash
service=elasticsearch
time="$(date)"

if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
echo "$time $service is running!!!"
else
/opt/java/liferay/elasticsearch/bin/elasticsearch -d
fi
