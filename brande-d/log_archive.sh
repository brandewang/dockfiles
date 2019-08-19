#!/bin/sh
LOG_DIR='/data/logs'

date=`date +%Y-%m-%d`
yesterday=`date -d "-1 day"   +%Y-%m-%d`
#归档
logs=`find ${LOG_DIR} -regex '.*catalina.out\|.*start.log'`
for log in ${logs}
do
    new_log=${log}-${date}
    echo cp ${log} ${new_log}
    cp ${log} ${new_log}
    echo > ${log}
done

#gzip
logs=`find ${LOG_DIR} -name *${yesterday}*|grep -v 'zip\|gz'`
for log in ${logs}
do
    echo $log
    gzip ${log}
done

#delete
date=`date -d '7 days ago'  +%Y-%m-%d`
logs=`find ${LOG_DIR} -regex '.*catalina.out\|.*start.log'`
for log in ${logs}
do
    path=`echo ${log}|awk -F '/' '{print $1"/"$2"/"$3"/"$4"/"$5}'`
    cd ${path}
    del_logs=`ls|grep ${date}`
    for del_log in ${del_logs}
    do
        rm $del_log
    done
done
