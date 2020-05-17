#!/bin/sh
/usr/sbin/crond
echo '10 0 * * * /bin/sh /log_archive.sh' >> /var/spool/cron/crontabs/root
/usr/bin/supervisord -c /etc/supervisord.conf
