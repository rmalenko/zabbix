#!/bin/bash
#
# Simple Zabbix check for nvme using nvme-cli
# Author: Rostyslav Malenko
#
# Requirements:
# nvme-cli - git clone https://github.com/linux-nvme/nvme-cli
#
# Usage:
# ./zabbix_check_nvme.sh

DISKNVMECHK="$1"
sudo /usr/sbin/nvme smart-log --output-format=json /dev/$DISKNVMECHK
