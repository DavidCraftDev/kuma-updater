#!/bin/sh

if [ -z "$TZ" ] || ! echo "$TZ" | grep -q "^[A-Za-z/]\+$"; then
    echo "TZ is unset or invalid."
    sleep inf
fi

if [ -z "$URL" ] || ! echo "$URK" | grep -q "(http|https)://[a-zA-Z0-9./?=_%:-]*"; then
    echo "URL is unset or invalid"
    sleep inf
fi

if ! echo "$UI" | grep -q "^[0-9]\+[smhd]\?$"; then
    echo "UI needs to be a number which can be followed by one of the chars s, m, h or d."
    sleep inf
fi

while true; do
    curl -sL "$URL" | tee /tmp/kuma.json

    sleep "$UI"
done
