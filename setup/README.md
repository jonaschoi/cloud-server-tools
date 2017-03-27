# setup
Files needed to setup and run a Liferay Sales bundle

## motd
Place in /etc
Edit with vim/nano to change login message

## portal-ext.properties
Place in ${LIEFRAY_HOME}

## server7.xml
Change filename to remove the 7
Place in ${LIEFRAY_HOME}/${TOMCAT_HOME}/conf

## setup-wildcard.sh
Place in /opt/java
usage "./setup-wildcard.sh ${BUNDLE_NAME}"
Also expects JDK install file, license key, tomcat, and virtual_host file

## tomcat
Scripted commands for tomcat bundles
Usage "service tomcat start|stop|status|kill|restart"

## virtual_host.conf
Virtual host file for Apache HTTPD for use with HTTPS and LRDC pop-up.

## virtual_host_alt.conf
Virtual host file for Apache HTTPD for use with HTTPS and demo pop-up.

## virtual_host_ldx.conf
Virtual host file for Apache HTTPD for use with HTTPS.