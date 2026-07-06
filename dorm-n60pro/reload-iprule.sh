#!/bin/sh

ip rule add fwmark 1100 table 1100 pref 30100
ip route add local default dev lo table 1100

# process other routes, only hold default
ip rule add from all table main suppress_prefixlength 0 pref 30000
# go through our default routes
ip rule add fwmark 1000 table main pref 30100
ip rule add fwmark 1001 table 1001 pref 30100
ip rule add fwmark 1002 table 1002 pref 30100
ip rule add fwmark 1003 table 1003 pref 30100
ip rule add fwmark 1004 table 1004 pref 30100
# kernel default rule
# 32766:  from all lookup main

# ip -6 rule add to 240c:c7b9:0:400::/64 table main pref 30000
ip -6 rule add fwmark 1100 table 1100 pref 30100
ip -6 route add local default dev lo table 1100