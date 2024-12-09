#!/bin/bash

Default_CPU=80
Default_Mem=80

usage()
{
    echo "Usage = $0 [-t <CPU threshold>] [-m <Memory threshold>] [-l <log file>]"
    echo -t "CPU threshold: (default 80%)" 
    echo -m "Memory threshold: (default 80%)"
    echo -l "Log file showing high resource processes"
    exit 1
}

while getopts "t:m:l:" opt; do
    case $opt in
        t) CPU_threshold=$OPTARG ;;
        m) MEM_threshold=$OPTARG ;;
        l) LOG_FILE=$OPTARG ;;
        *) usage ;;
    esac
done

if [[ -z "$LOG_FILE" ]]; then
    echo "Error: Log file not specified"
    usage
fi

CPU_threshold=${CPU_threshold:-$Default_CPU}
MEM_threshold=${MEM_threshold:-$Default_Mem}

if ! command -v ps &> /dev/null; then
    echo "Error: ps command was not provided. Please ensure it's installed"
    exit 1
fi

if ! touch "$LOG_FILE" &> /dev/null; then
    echo "Error: Cannot write to log file: $LOG_FILE"
    exit 1
fi

while true; do
    ps -eo pid,%cpu,%mem,etime,comm | sort -k 2 -r | awk -v cpu="$CPU_threshold" -v mem="$MEM_threshold" 'NR > 1 && ($2 > cpu || $3 > mem) {print $0}' | while read -r line; do
        PID=$(echo "$line" | awk '{print $1}')
        CPU=$(echo "$line" | awk '{print $2}')
        MEM=$(echo "$line" | awk '{print $3}')
        ELAPSED=$(echo "$line" | awk '{print $4}')
        COMMAND=$(echo "$line" | awk '{$1=$2=$3=$4=""; print $0}' | xargs)

        ELAPSED_MIN=$(echo "$ELAPSED" | awk -F: '{if (NF==2) print $1; else print $1*60 + $2}')

        TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
        echo "$TIMESTAMP: PID $PID, CPU ${CPU}%, MEM ${MEM}%, COMMAND $COMMAND" >> "$LOG_FILE"

        if [[ "$ELAPSED_MIN" -ge 10 ]]; then
            kill -SIGTERM "$PID" && \
            echo "$TIMESTAMP: Terminating PID $PID for exceeding resource usage threshold" >> "$LOG_FILE"
        fi
    done
    sleep 30
done