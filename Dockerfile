# FROM java:8
FROM 32bit/ubuntu:14.04
MAINTAINER Ildemaro Medina <imedina@gsgtech.com>

VOLUME /tmp
RUN mkdir /usr/local/java
RUN apt-get update
RUN apt-get -qq -y install curl
RUN curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jre-8u65-linux-i586.tar.gz"
RUN tar -xzvf /jre-8u65-linux-i586.tar.gz 
RUN mv  /jre1.8.0_65 /usr/local/java/
RUN update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jre1.8.0_65/bin/java" 1
RUN sudo update-alternatives --set java /usr/local/java/jre1.8.0_65/bin/java
RUN export JAVA_HOME=/usr/local/java/jre1.8.0_65/
RUN ls -ld /usr/bin/java*
ADD target/servicioa-1.0.jar app.jar 
ADD target/libs libs
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]


