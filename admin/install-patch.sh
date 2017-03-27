#! /bin/bash

username=$1
fixpack=$2

#download patch
wget --user=$username --ask-password -P /opt/java/liferay/patching-tool/patches https://files.liferay.com/private/ee/fix-packs/7.0.10/de/liferay-fix-pack-de-$fixpack-7010.zip
#wget --user=$username --ask-password -P /opt/java/liferay/patching-tool/patches https://files.liferay.com/private/ee/fix-packs/6.2.10/portal/liferay-fix-pack-portal-132-6210.zip

#shutdown server
service tomcat stop

#install patch
/opt/java/liferay/patching-tool/patching-tool.sh install


#clear cache
/opt/java/liferay/clear-cache.sh

#start server
service tomcat start