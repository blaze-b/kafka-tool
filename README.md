# Kafka-tool-Server Running Scripts

  1. Download the following kafka server from the following link: https://kafka.apache.org/quickstart -> https://www.apache.org/dyn/closer.cgi?path=/kafka/3.2.0/kafka_2.12-3.2.0.tgz
  2. Unzip the file using the following command: `tar -xzf kafka_2.12-3.2.0.tgz`
  3. After unzipping the file go to the file `server.properties` and uncomment the `listeners` and the change the `log.dirs`, In the zookeeper.properties change the `dataDir` to the  local path
  4. Use the jdk 11 for the kafdrop setup
  6. Download the view kafdrop from, https://github.com/obsidiandynamics/kafdrop/releases, Current version: https://github.com/obsidiandynamics/kafdrop/releases/tag/3.30.0
  8. For reference please find the image file Structure_files.PNG

## Shell scripts

  1. Command to bring the zookeeper server up<br />
    `bin/windows/zookeeper-server-start.bat config/zookeeper.properties`
  2. Command to bring the kafka server up <br />
    `bin/windows/kafka-server-start.bat config/server.properties`
  3. Command to create a topic<br />
    `bin/windows/kafka-topics.bat --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test`
  4. Command to send messages using the producer template<br />
    `bin/windows/kafka-console-producer.bat --broker-list localhost:9092 --topic test`
  5. Command to consume the messages send to the topic<br />
    `bin/windows/kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic test --from-beginning`

## Windows command line scripts

  1. `bin\windows\zookeeper-server-start.bat config/zookeeper.properties`
  2. `bin\windows\kafka-server-start.bat config/server.properties`
  3. `bin\windows\kafka-topics.bat --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test`
  4. `bin\windows\kafka-console-producer.bat --broker-list localhost:9092 --topic test`
  5. `bin\windows\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic test --from-beginning`
  6. Kafdrop Command to bring the server up for testing on port 9001, `D:\Applns\openlogic-openjdk-11.0.8+10-windows-x64\openlogic-openjdk-11.0.8+10-win-x64\bin\java -jar kafdrop-3.30.0.jar --server.port=9001 --management.server.port=9001`
  7. After bringing the kafdrop up use the link below for navigation http://localhost:9001/

## Delete a topic

  1. `bin\windows\kafka-topics.bat --zookeeper localhost:2181 --topic test --delete` <br />
  2. `delete.topic.enable=true in the server.properties file`
