#!/bin/bash
export MAC_ADDRESS=`cat /sys/class/net/eth0/address`
$@
