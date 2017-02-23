#!/bin/bash

# Start function
function startEcho {
  echo "Starting uWebSockets echo example, connect to url: $(echo $APP_URL | sed 's/https/wss/g')"
  echo ""
  ${HOME}/uWebSockets/examples/echo & 
}

# Shutdown function
function shutdownEcho {
  kill -SIGTERM $(jobs -p)
}

# When we get signal "SIGTERM", shutdown echo
trap shutdownEcho SIGTERM

# Start echo 
startEcho

# Wait for echo to shutdown
wait 

