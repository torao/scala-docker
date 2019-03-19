FROM openjdk:11-jdk-slim

ARG version="2.12.8"
ARG sbt_version="1.2.8"

ENV SCALA_HOME /root/scala-$version
ENV PATH $PATH:$SCALA_HOME/bin:/root/sbt/bin

WORKDIR /opt

CMD $SCALA_HOME/bin/scala

RUN apt-get update \
&&  apt-get install -y wget \
&&  wget https://downloads.lightbend.com/scala/$version/scala-$version.tgz \
&&  tar zxvf scala-$version.tgz -C /root \
&&  rm scala-$version.tgz \
&&  wget https://piccolo.link/sbt-$sbt_version.tgz \
&&  tar zxvf sbt-$sbt_version.tgz -C /root \
&&  rm sbt-$sbt_version.tgz \
&&  echo exit | /root/sbt/bin/sbt \
&&  java -version > /root/versions 2>&1 \
&&  /root/scala-$version/bin/scala -version >> /root/versions 2>&1 \
&&  echo "\\ncat /root/versions\\n" >> /root/.bashrc \
&&  apt-get remove -y wget \
&&  apt-get clean

