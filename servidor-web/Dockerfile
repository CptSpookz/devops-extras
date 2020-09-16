FROM ubuntu:20.04 as builder

ENV TZ America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt update && \
    apt install -y git maven openjdk-8-jdk

WORKDIR /var/lib/tomcat7/conf/
ADD .keystore .

RUN git clone https://github.com/dtsato/loja-virtual-devops.git /opt/loja-virtual-devops
WORKDIR /opt/loja-virtual-devops

ENV MAVEN_OPTS -Xmx256m
RUN mvn install
RUN mkdir /build && cp ./combined/target


FROM tomcat:10.0-jdk8 as runner

COPY --from=builder /build/*.war /usr/local/tomcat/webapps/

ENV JAVA_OPTS -Djava.awt.headless=true -Xmx512M -XX:+UseConcMarkSweepGC

EXPOSE 8080

CMD ["catalina.sh", "run"]