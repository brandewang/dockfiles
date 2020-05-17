#!/bin/sh
/usr/sbin/crond
echo '10 0 * * * /bin/sh /log_archive.sh' >> /var/spool/cron/root
/usr/bin/supervisord -c /etc/supervisord.conf
