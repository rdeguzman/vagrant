#!/usr/bin/env bash
LOG="provision-script.log"
KAFKA_VERSION="2.11-0.11.0.0"

sudo apt-get update -y >>/tmp/$LOG 2>&1

echo "Installing: openjdk-8"
sudo apt-get install openjdk-8-jdk -y >>/tmp/$LOG 2>&1

echo "Installing: zookeeper"
sudo apt-get install zookeeperd -y >>/tmp/$LOG 2>&1

mkdir -p /root/downloads
wget http://apache.melbourneitmirror.net/kafka/0.11.0.0/kafka_$KAFKA_VERSION.tgz

cd /root/downloads
tar -zxvf kafka_$KAFKA_VERSION.tgz
mv kafka_$KAFKA_VERSION /usr/local/
ln -s /usr/local/kafka_$KAFKA_VERSION /usr/local/kafka

echo "export PATH=$PATH:/usr/local/kafka/bin
export KAFKA_PORT='9092'
export ZOOKEEPER_PORT='2181'

alias kafka_console_producer='kafka-console-producer.sh --broker-list localhost:$KAFKA_PORT --topic $1'
alias kafka_console_consumer='kafka-console-consumer.sh --bootstrap-server localhost:$KAFKA_PORT --topic $1'

alias kafka_topic_create='kafka-topics.sh --create --zookeeper localhost:$ZOOKEEPER_PORT --replication-factor 1 --partitions 1 --topic $1'
alias kafka_topic_delete='kafka-topics.sh --delete --zookeeper localhost:$ZOOKEEPER_PORT --topic $1'
alias kafka_topic_list='kafka-topics.sh --list --zookeeper localhost:$ZOOKEEPER_PORT'" >> /root/.bash_profile
