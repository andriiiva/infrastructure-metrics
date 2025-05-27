#!/bin/sh

cp /tmp/web.yml.tpl /tmp/web.yml

env | while IFS='=' read -r name value; do
  escaped_value=$(printf '%s\n' "$value" | sed 's/[&/\\]/\\&/g')
  sed -i "s|\${$name}|$escaped_value|g" /tmp/web.yml
done

# Start Pushgateway with config
exec /bin/pushgateway \
  --web.listen-address=:8080 \
  --web.config.file=/tmp/web.yml