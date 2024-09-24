FROM cassandra:4.0
COPY custom-entrypoint.sh /custom-entrypoint.sh
COPY cassandra.yaml /etc/cassandra/cassandra.yaml
RUN chmod +x /custom-entrypoint.sh && \
    chown cassandra:cassandra /etc/cassandra/cassandra.yaml
USER cassandra
EXPOSE 7000 7001 7199 9042 9160
ENTRYPOINT ["/custom-entrypoint.sh"]
CMD ["cassandra", "-f"]