#!/bin/sh

set -e

# Start Node.js server in the background
node server.js &

# Wait for the server to start
sleep 2

server_address="http://localhost:3000"  # Replace with your server address
timeout_seconds=5  # Adjust the timeout as needed

# Perform a quick check using curl
set +e # Disable exit on error temporarily
curl -s --max-time $timeout_seconds $server_address > /dev/null 2> curl_error.log
curl_exit_status=$?  # Save the exit status
set -e # Enable exit on error again

# Check the exit status of curl
if [ $curl_exit_status -eq 0 ]; then
    echo "Server is running."
else
    echo "Server is not running or not reachable. Error $curl_exit_status"
fi

# Wait for the server to start
sleep 2

while true; do
    response_code=$(curl -s -o /dev/null -w "%{http_code}" $server_address/health)
    
    if [ "$response_code" -eq 200 ]; then
        echo "Health check passed: $response_code"
    else
        echo "Health check failed: $response_code"
        # If health check fails, stop the Node.js server
        pkill -f "node server.js"
        exit 1
    fi

    sleep 2
done
