#!/bin/sh
#/usr/sbin/sshd  -E /var/log/sshd.log -f /etc/ssh/sshd_config
echo '10 0 0 0 0 sh log_archive.sh' >> /var/spool/cron/crontabs/root
crond
java -jar brande-d.jar > /data/logs/brande-d/start.log 2>&1
