#!/usr/bin/env bash
# https://serveradmin.ru/monitoring-vremeni-delegirovaniya-domena-v-zabbix/

DOMAIN="$1"
 
data=$(whois $1 | grep -E 'paid|Expir|expires' | grep -o -E '[0-9]{4}.[0-9]{2}.[0-9]{2}|[0-9]{2}/[0-9]{2}/[0-9]{4}' | tr . / | awk 'NR == 1')
expire=$((`date -d "$data" '+%s'`))
today=$((`date '+%s'`))
lefts=$(($expire - $today))
leftd=$(($lefts/86400))
echo $leftd