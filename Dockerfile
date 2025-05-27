FROM prom/pushgateway:v1.11.1

COPY web.yml.tpl /tmp/web.yml.tpl
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["sh"]
CMD ["/entrypoint.sh"]