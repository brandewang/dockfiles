#!/bin/sh
LOG_DIR='/opt/logs'

date=`date +%Y-%m-%d`
#archive
logs=`find ${LOG_DIR} -regex '.*log'`
for log in ${logs}
do
    new_log=${log}-${date}
    echo cp ${log} ${new_log}
    cp ${log} ${new_log}
    echo > ${log}
done

#delete
find ${LOG_DIR}  -regex '.*log.*' -mtime +7|xargs rm -f
