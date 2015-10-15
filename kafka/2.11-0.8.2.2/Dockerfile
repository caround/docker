FROM adaphi/java:7-jre

RUN useradd -ms /bin/bash kafka

ENV SCALA_VERSION=2.11 \
    KAFKA_VERSION=0.8.2.2 \
    KAFKA_HOME=/usr/local/kafka \
    KAFKA_LOG_DIR=/var/log/kafka \
    LOG_DIR=/var/log/kafka

RUN mkdir -p $KAFKA_HOME \
&&  curl -OL "http://apache.spinellicreations.com/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" \
&&  tar xzf /kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz -C $KAFKA_HOME --strip-components=1 \
&&  rm -f /kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz \
&&  mkdir -p /var/log/kafka \
&&  chown -R kafka:kafka $KAFKA_LOG_DIR

ENV  PATH=$PATH:$KAFKA_HOME/bin

USER kafka

COPY server.properties $KAFKA_HOME/config/server.properties
COPY entrypoint.sh /entrypoint.sh

VOLUME ["$KAFKA_LOG_DIR"]

EXPOSE 9092

WORKDIR $KAFKA_HOME
ENTRYPOINT ["/entrypoint.sh"]
CMD ["kafka-server-start.sh", "config/server.properties"]
