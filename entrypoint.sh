#!/bin/sh

# Export all environment variables in the format VAR=value
env | while IFS='=' read -r name value; do
  # Escape special characters for sed
  escaped_value=$(printf '%s\n' "$value" | sed 's/[&/\]/\\&/g')

  # Replace all ${VAR} placeholders in the templates
  sed -i "s|\${$name}|$escaped_value|g" /etc/prometheus/prometheus.yml.tpl
  sed -i "s|\${$name}|$escaped_value|g" /etc/prometheus/web.yml.tpl
done

# Rename the processed template files to final config files
mv /etc/prometheus/prometheus.yml.tpl /etc/prometheus/prometheus.yml
mv /etc/prometheus/web.yml.tpl /etc/prometheus/web.yml

# Start Prometheus with the generated configs
exec /bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/prometheus \
  --web.config.file=/etc/prometheus/web.yml \
  --web.listen-address=:8080