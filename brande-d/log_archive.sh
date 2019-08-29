#!/bin/sh
LOG_DIR='/data/logs'

date=`date +%Y-%m-%d`
#archive
logs=`find ${LOG_DIR} -regex '.*catalina.out\|.*start.log'`
for log in ${logs}
do
    new_log=${log}-${date}
    echo cp ${log} ${new_log}
    cp ${log} ${new_log}
    echo > ${log}
done

#delete
find ${LOG_DIR}  -regex '.*catalina.out.*\|.*start.log.*' -mtime +3|xargs rm -f
