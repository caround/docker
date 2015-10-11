FROM centos:7

ENV JAVA_VERSION=8u60 \
    BUILD_VERSION=b27 \
    JAVA_HOME=/usr/local/java

RUN mkdir -p $JAVA_HOME \
&&  curl -OL "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.tar.gz" \
    -H "Cookie: oraclelicense=accept-securebackup-cookie" \
&&  tar -xzf /jdk-$JAVA_VERSION-linux-x64.tar.gz -C $JAVA_HOME --strip-components=1 \
&&  rm -f /jdk-$JAVA_VERSION-linux-x64.tar.gz

ENV PATH=$PATH:$JAVA_HOME/bin

CMD ["bash"]
