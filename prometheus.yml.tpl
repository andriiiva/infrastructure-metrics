global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    metrics_path: /metrics
    static_configs:
      - targets: ['${BASIC_URL}']
    basic_auth:
      username: "${BASIC_USER}"
      password: "${BASIC_PASSWORD}"

  - job_name: 'pushgateway'
    static_configs:
      - targets: ['${PUSHGATEWAY_URL}']
    basic_auth:
      username: "${PUSHGATEWAY_USER}"
      password: "${PUSHGATEWAY_PASSWORD}"