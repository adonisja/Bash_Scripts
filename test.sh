#!/bin/bash

#Linux: ps -eo pid,user,pcpu,pmem,comm --sort=-pcpu
#Mac OS: ps aux | sort -nrk 3,3 | awk 'NR==1{print "PID USER %CPU %MEM COMMAND"} {print $2, $1, $3, $4, $11}'

jobs