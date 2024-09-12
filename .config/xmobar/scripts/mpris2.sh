#!/bin/bash

# Get the MPRIS information
mpris_info=$(playerctl --player=playerctld metadata --format '{{ artist }} - {{ title }}')

# Truncate the output to 15 characters, adding trailing dots if needed
truncated_info=$(printf '%.35s' "$mpris_info")
if [ ${#mpris_info} -gt 35 ]; then
  truncated_info="${truncated_info}..."
fi

echo "$truncated_info"
