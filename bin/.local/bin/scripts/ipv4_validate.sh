#!/bin/bash

### Written with help of Claude.ai

# Check if argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <ip_address>" >&2
  exit 1
fi

validate_ip() {
  local ip=$1

  # Check if input is in x.x format
  if [[ $ip =~ ^[0-9]+\.[0-9]+$ ]]; then
    ip="192.168.$ip"
  fi

  # Check if IP starts with 192.168
  if ! [[ $ip =~ ^192\.168\. ]]; then
    echo "Error: IP address must start with 192.168 or be in x.x format" >&2
    exit 1
  fi

  # Split IP into octets
  IFS='.' read -r -a octets <<< "$ip"

  # Check if we have exactly 4 octets
  if [ ${#octets[@]} -ne 4 ]; then
    echo "Error: Invalid IP address format" >&2
    exit 1
  fi

  # Validate each octet
  for octet in "${octets[@]}"; do
    if ! [[ $octet =~ ^[0-9]+$ ]] || [ $octet -lt 0 ] || [ $octet -gt 255 ]; then
      echo "Error: Each octet must be between 0 and 255" >&2
      exit 1
    fi
  done

  echo "$ip"
}

validate_ip "$1"
