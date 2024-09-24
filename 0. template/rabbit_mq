FROM rabbitmq:3.9-management-alpine
COPY rabbitmq.conf /etc/rabbitmq/
COPY definitions.json /etc/rabbitmq/
RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf /etc/rabbitmq/definitions.json
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_federation_management
EXPOSE 5672 15672
USER rabbitmq
CMD ["rabbitmq-server"]