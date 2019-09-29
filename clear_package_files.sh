#!/bin/sh
###########################
## @ Author:
##
##
###########################
DATAFILEDIR=/var/devops/datafiles/prod/

## 生成目录文件
ls -al ${DATAFILEDIR} >filename.txt

CUR_YEAR=`date +%Y`
XX='XXX===XXX'

for i in {1..10}; do
   NUM=`date -d "-$i year" +%Y`
   sed -i "s/${NUM}/${XX}/g" filename.txt
done

for x in `cat dir.txt |awk -F"${XX}" '{print $1}' |sort -u`; do
   for fn in `ls -al ${DATAFILEDIR} |grep "{$x}${XX}.*" |sort -r |sed -n '4,$p'`; do
       echo "Deleting <$fn>..."
   done
done
rm -rf filename.txt
