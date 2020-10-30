#!/bin/bash

apt update && apt install -y curl git openjdk-11-jdk

curl https://mirror.its.dal.ca/apache/kafka/2.6.0/kafka_2.13-2.6.0.tgz > kafka.tgz

tar xzf kafka.tgz

#mv kafka /opt/kafka
