FROM adaphi/java:8-jdk

RUN useradd -ms /bin/bash solr

ENV SOLR_VERSION=5.3.1 \
    SOLR_DATA=/var/solr \
    SOLR_HOME=/var/solr/data \
    SOLR_INSTALL_DIR=/usr/local/solr \
    SOLR_PID_DIR=/var/solr \
    SOLR_LOGS_DIR=/var/solr/logs \
    LOG4J_PROPS=/var/solr/log4j.properties

RUN mkdir -p $SOLR_INSTALL_DIR $SOLR_HOME $SOLR_LOGS_DIR \
&&  curl -OL "http://mirrors.ibiblio.org/apache/lucene/solr/${SOLR_VERSION}/solr-${SOLR_VERSION}.tgz" \
&&  tar xzf /solr-${SOLR_VERSION}.tgz -C $SOLR_INSTALL_DIR --strip-components=1 \
&&  rm -f /solr-${SOLR_VERSION}.tgz \
&&  mkdir -p $SOLR_DATA \
&&  chown -R solr:solr $SOLR_DATA \
&&  yum install -y lsof

VOLUME ["$SOLR_DATA"]
EXPOSE 8983
USER solr

ENV PATH=$PATH:$SOLR_INSTALL_DIR/bin

COPY log4j.properties ${SOLR_DATA}/log4j.properties
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["solr"]
