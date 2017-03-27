#! /bin/bash

filename=$1
ext="${filename##*.}"
name="${filename%.*}"

#Update motd
cp ~/setup/motd /etc/motd

#Move cron dir
cp -arf ~/setup/cron ~/

#Update JDK
tar -zxvf ~/setup/jdk-8u92-linux-x64.tar.gz
sleep 10s
cp -arf ~/setup/jdk1.8.0_92 /opt/java
rm -rf /opt/java/jdk
ln -s /opt/java/jdk1.8.0_92 /opt/java/jdk
rm -rf ~/setup/jdk1.8.0_92

#Copy bundle to location
cp ~/setup/$filename /opt/java/

#Unzip bundle
unzip /opt/java/$filename -d /opt/java
sleep 1m

#Remove Zip file
rm -f /opt/java/$filename

#Symlink Liferay bundle
ln -s /opt/java/$name liferay

#Copy symlink liferay
cp -arf ~/setup/liferay /opt/java/
rm -rf ~/setup/liferay

#Symlink Tomcat
ln -s /opt/java/liferay/tomcat* tomcat

#Move symlink tomcat
mv ~/setup/tomcat /opt/java/liferay

#Change permissions
chmod 755 -R /opt/java/liferay/*

#Remove *.bat files
rm -rf /opt/java/$name/tomcat/bin/*.bat

#Remove MacOS files
find /opt/java/liferay -name '.DS_Store' -type f -delete
find /opt/java/liferay -name '__MACOSX' -type d -exec rm -r {} \;

#Copy in server.xml
#cp ~/server7.xml /opt/java/liferay/tomcat/conf/

#Copy in LCS file
cp ~/*.aatf /opt/java/$name/data

#Add cache clear files
cp clear-cache.sh /opt/java/$name

#Create service
cp ~/setup/cron/tomcat /etc/init.d/
chmod 755 /etc/init.d/tomcat
chkconfig --add tomcat
chkconfig tomcat on

#Start Liferay
#service tomcat start

#Copy in virtual_host.conf for httpd
cp ~/setup/virtual_host.conf /etc/httpd/conf.d/

#Restart HTTPD
service httpd restart

#Remove files
#rm -rf ~/license-portal*.xml ~/liferay-tomcat-dev.zip server.xml ~/virtual_host.conf
#rm -rf ~/$filename ~/server.xml ~/virtual_host.conf ~/*.aatf

#Remove self
#rm -rf ~/setup-wildcard.sh

# @hourly ~/cron/service_check_tomcat.sh &>~/cron/cron.log