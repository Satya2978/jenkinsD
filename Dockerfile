FROM ubuntu
LABEL maintainer="satya.bhs@gmail.com"
ARG USERNAME=tomuser
ARG UID=2000
ARG GID=2000
RUN groupadd -g $GID -o $USERNAME
RUN useradd -u $UID -g $GID -o -s /bin/bash $USERNAME
RUN apt update
RUN apt-get install openjdk-11-jdk -y
RUN apt-get install wget -y
RUN cd /opt/ && wget https://repo.maven.apache.org/maven2/org/apache/tomcat/tomcat/9.0.0.M17/tomcat-9.0.0.M17.tar.gz
RUN cd /opt/ && tar -xvf /opt/tomcat-9.0.0.M17.tar.gz
RUN cd /opt/apache-tomcat-9.0.0.M17/webapps && rm -rf *;
ADD https://github.com/ksrepo9/test/raw/refs/heads/master/ksdemo.war /opt/apache-tomcat-9.0.0.M17/webapps
CMD sh /opt/apache-tomcat-9.0.0.M17/bin/catalina.sh run
