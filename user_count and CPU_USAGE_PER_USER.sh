#! /bin/bash
ps -eo user,%cpu,%mem --sort=-%cpu | \
awk 'NR>1 {cpu[$1]+=$2; mem[$1]+=$3; count[$1]++}
END {
printf "%-15s %-10s %-10s %-10s\n","USER","CPU","MEM","PROCESSES";
for (i in cpu)
printf "%-15s %-10.2f %-10.2f %-10d\n",i,cpu[i],mem[i],count[i]
#- left aligh
#15 string size
#s string
#% formet specifier
#NR>1 skip first line
}'
