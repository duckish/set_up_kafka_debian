#!/bin/bash

apt update && apt install -y curl git openjdk-11-jdk

### go to this https://kafka.apache.org/downloads to check for new version
curl https://mirror.its.dal.ca/apache/kafka/2.6.0/kafka_2.13-2.6.0.tgz > all_files.tgz

tar xzf all_files.tgz
mv kafka_2.13-2.6.0 /opt/kafka

### set up services
cp services_conf/zookeeper.service /etc/systemd/system/zookeeper.service
cp services_conf/kafka.service /etc/systemd/system/kafka.service

systemctl daemon-reload

### start Kafka and Zookeeper
systemctl start zookeeper
systemctl start kafka
