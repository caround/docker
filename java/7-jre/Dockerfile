FROM centos:7

ENV JAVA_VERSION=7u80 \
    BUILD_VERSION=b15 \
    JAVA_HOME=/usr/local/java

RUN mkdir -p $JAVA_HOME \
&&  curl -OL "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/server-jre-$JAVA_VERSION-linux-x64.tar.gz" \
    -H "Cookie: oraclelicense=accept-securebackup-cookie" \
&&  tar -xzf /server-jre-$JAVA_VERSION-linux-x64.tar.gz -C $JAVA_HOME --strip-components=1 \
&&  rm -f /server-jre-$JAVA_VERSION-linux-x64.tar.gz

ENV PATH $PATH:$JAVA_HOME/bin

CMD ["bash"]
