#!/bin/bash

sleep 100 &
pid=$!

echo "New Process started, PID: $pid"

sleep 10
if ps -p $pid > /dev/null; then
    echo "Process is still running, terminating"
    kill $pid
    echo "Process $pid was Terminated"
else
    echo "Process $pid was completed"

