#!/bin/bash
############################
## Spring-boot V1.0
##
############################

PRONAME="$1"

APPDIR="/var/www/webapps/${PRONAME}"
LOGDIR="/opt/apache-tomcat-${PRONAME}/logs"
JAVA_HOME='/usr/java/jdk1.8.0_112/bin'
JAVA_OPTS="$JAVA_OPTS -Xmx3G -Xms3G -XX:PermSize=128m -XX:MaxPermSize=256m \
                      -Dfile.encoding=UTF8 -Dsun.jnu.encoding=UTF8 \
                      -Dloader.path=file:///$APPDIR/WEB-INF/classes"

jarfile="${PRONAME}-exec.jar"

killPort() {
   ps -ef | grep java| grep "${PRONAME}" | awk '{print $2}' | xargs kill -9 >/dev/null 2>&1
}
killPort

#echo "nohup java $JAVA_OPTS -jar $APPDIR/$jarfile > "${LOGDIR}/catalina.out" 2>&1 &"

nohup ${JAVA_HOME}/java $JAVA_OPTS -jar $APPDIR/$jarfile --spring.profiles.active=prod \
                          --zookeeper.config.address=10.0.0.2:2181  >>"${LOGDIR}/catalina.out" 2>&1 &
