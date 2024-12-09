#//bin/bash
echo "Starting script..."

sleep 60 &

pid=$!
echo "Process started with PID: $pid"

sleep 5

if ps -p $pid > /dev/null; then
    echo "Process is still running..."
    kill $pid
    echo "Process has been terminated."
else
    echo "Process completed successfully!"
fi