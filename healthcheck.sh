#!/bin/sh

if ! [ -f /tmp/kuma.json ]; then 
  exit 1
fi

if [ -f /tmp/kuma.json ] && [ "$(jq -r .status </tmp/kuma.json)" != "{"ok":true}" ]; then 
  exit 1
fi

exit 0
