# admin
Files to administrate the Tomcat server.

## clear-cache.sh
- Place in /opt/java/liferay
- Clears (deletes) the Tomcat server cache and OSGi cache.

## install-patch.sh
- Place in /opt/java/liferay
- Requires clear-cache.sh to complete functinos
- Usage "./install-patch.sh first.last ${fixpack-number}"
- Will prompt for LRDC password.