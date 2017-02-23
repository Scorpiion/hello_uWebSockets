#!/bin/bash

# Start function
function startEcho {
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

