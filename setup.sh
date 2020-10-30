#!/bin/bash

apt update && apt install -y curl git openjdk-11-jdk

### go to this https://kafka.apache.org/downloads to check for new version
curl https://mirror.its.dal.ca/apache/kafka/2.4.1/kafka_2.13-2.4.1.tgz > all_files.tgz

#curl https://mirror.its.dal.ca/apache/kafka/2.6.0/kafka_2.13-2.6.0.tgz > all_files.tgz

tar xzf all_files.tgz

EXTRACTED=`ls | grep kafka`

mkdir -p /opt/kafka
mv $EXTRACTED /opt/kafka

### set up services
cp services_conf/zookeeper.service /etc/systemd/system/zookeeper.service
cp services_conf/kafka.service /etc/systemd/system/kafka.service

systemctl daemon-reload

### start Kafka and Zookeeper
systemctl start zookeeper
systemctl start kafka
