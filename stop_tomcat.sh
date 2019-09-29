#!/bin/sh
#kill tomcat pid
name=tomcat-app
pidlist=`ps -ef | grep $name | grep -v "grep" | awk '{print $2}'`
function stop(){
if [ "$pidlist" == "" ]
then
echo "----$name 已经关闭----"
exit 0
else
echo "----name进程号:pidlist"
kill -9 $pidlist
echo "KILL $pidlist:"
fi
}

stop
pidlist2=`ps -ef | grep $name | grep -v "grep" | awk '{print $2}'`
if [ "$pidlist2" == "" ]
then
echo "----关闭$name成功----"
else
echo "----关闭$name失败----"
fi
