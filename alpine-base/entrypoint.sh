#!/bin/sh
/usr/sbin/sshd  -E /var/log/sshd.log -f /etc/ssh/sshd_config
/bin/sh
#/usr/bin/supervisord -c /etc/supervisord.conf
