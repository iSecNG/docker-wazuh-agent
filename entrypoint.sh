#!/bin/bash

# Install the agent (with set environment vars)
apt-get install -y wazuh-agent=4.8.0-1

# Start the agent
/var/ossec/bin/wazuh-control start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start agent: $status"
  exit $status
fi

echo "background jobs running, listening for changes"

while sleep 60; do
  /var/ossec/bin/wazuh-control status > /dev/null 2>&1
  status=$?
  if [ $status -ne 0 ]; then
    echo "looks like the agent died."
    exit 1
  fi
done
