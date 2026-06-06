#!/bin/sh
PORT=${PORT:-8080}
sed -i "s/8080/$PORT/g" /etc/xray/config.json
exec xray run -config /etc/xray/config.json
