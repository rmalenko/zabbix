#!/bin/bash

# zabbix_check_nvme_discovery.sh
# Author: Rostyslav Malenko
# Requirements: zabbix_check_nvme.sh

JSON=$(for i in $(lsblk -e 11,253 -dn -o NAME | grep nvme); do printf "{\"{#NVMECHK}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')
printf "{\"data\":["
printf "$JSON"
printf "]}"
