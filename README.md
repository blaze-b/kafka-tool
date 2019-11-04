# Kafka-tool
Kafka Server Running Scripts
1) Download the following kafka server from the following link: https://kafka.apache.org/quickstart -> https://www.apache.org/dyn/closer.cgi?path=/kafka/2.3.0/kafka_2.12-2.3.0.tgz
2) Unzip the file using the following command: tar -xzf kafka_2.12-2.3.0.tgz
3) After unzipping the file go to the file: server.properties and uncomment the listeners and the change the log.dirs, Same to be done in the zookeeper.properties
4) After that install the jdk 11 version from the oracle version and place in the server path itself
5) Run the kafka_starter.bat after giving the correct path details.
6) Download the kafdrop from :-   https://bintray.com/obsidiandynamics/kafdrop/download_file?file_path=com%2Fobsidiandynamics%2Fkafdrop%2Fkafdrop%2F3.13.0%2Fkafdrop-3.13.0.jar
7) Use http://localhost:9000 to view the Kafdrop. Go inside the topic you want and click on “View Messages”

