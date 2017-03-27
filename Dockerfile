FROM java:8-jre

ENV ELASTICMQ_VERSION 0.13.2
# install
WORKDIR /elasticmq
RUN wget https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar -O elasticmq-server.jar
COPY custom.conf /elasticmq/custom.conf
COPY logback.xml /elasticmq/logback.xml

# run
ENTRYPOINT ["java", "-Dconfig.file=/elasticmq/custom.conf", "-Dlogback.configurationFile=/elasticmq/logback.xml", "-jar", "/elasticmq/elasticmq-server.jar"]
EXPOSE 80