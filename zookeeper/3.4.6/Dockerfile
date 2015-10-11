FROM adaphi/java:8-jre

RUN useradd -ms /bin/bash zookeeper

ENV ZK_VERSION=3.4.6 \
    ZK_DATA=/var/lib/zookeeper \
    ZK_LOG=/var/log/zookeeper  \
    ZK_HOME=/usr/local/zookeeper

RUN mkdir -p $ZK_HOME \
&&  curl -OL "http://apache.mirrors.tds.net/zookeeper/zookeeper-$ZK_VERSION/zookeeper-$ZK_VERSION.tar.gz" \
&&  tar xzf /zookeeper-$ZK_VERSION.tar.gz -C $ZK_HOME --strip-components=1 \
&&  rm -f /zookeeper-$ZK_VERSION.tar.gz \
&&  mkdir -p $ZK_DATA $ZK_LOG \
&&  chown -R zookeeper:zookeeper $ZK_DATA $ZK_LOG

COPY zoo.cfg $ZK_HOME/conf/zoo.cfg
COPY entrypoint.sh /entrypoint.sh

USER zookeeper

EXPOSE 2181 2888 3888

VOLUME ["$ZK_DATA", "$ZK_LOG", "$ZK_HOME/conf"]

ENV PATH=$PATH:$ZK_HOME/bin

ENTRYPOINT ["/entrypoint.sh"]
CMD ["zkServer.sh", "start-foreground"]
