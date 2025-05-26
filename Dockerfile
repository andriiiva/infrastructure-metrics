FROM prom/prometheus:v3.4.0

COPY prometheus.yml.tpl /etc/prometheus/prometheus.yml.tpl
COPY web.yml.tpl        /etc/prometheus/web.yml.tpl

COPY entrypoint.sh /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["sh"]
CMD ["/entrypoint.sh"]