FROM docker.elastic.co/elasticsearch/elasticsearch:7.14.0
COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/
RUN elasticsearch-plugin install analysis-icu
USER elasticsearch
EXPOSE 9200 9300
CMD ["elasticsearch"]