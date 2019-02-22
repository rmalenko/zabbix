#!/bin/bash
# domain_discovery.sh

JSON=$(for i in `cat /etc/zabbix/domains/domain_list.txt`; do printf "{\"{#DOMAIN}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')
printf "{\"data\":["
printf "$JSON"
printf "]}"