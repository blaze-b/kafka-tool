REM AUTHOR brianblaze14
@echo off
set KF_JAVA_HOME=D:\Applns\openlogic-openjdk-11.0.8+10-windows-x64\openlogic-openjdk-11.0.8+10-win-x64\bin
set KFDROP_PATH=./kafdrop
set KF_ROOT_PATH=./kafka_2.12-3.2.0
echo %KF_ROOT_PATH%
echo "************Starting Zookeeper***********************"
start /d  "%KF_ROOT_PATH%" bin\windows\zookeeper-server-start.bat config/zookeeper.properties
echo "************Zookeeper is up***********************"
echo "************Starting Kafka***********************"
pause
start /d "%KF_ROOT_PATH%" bin\windows\kafka-server-start.bat config/server.properties
echo "************Kafka is up***********************"
echo "************Create topic and press any key to continue***********************"
set /p topic=Enter Topic name: 
echo %topic%
pause
echo "************Created topic***********************"
start /d "%KF_ROOT_PATH%" bin\windows\kafka-topics.bat --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic %topic%
echo "Topic created successfully"
pause
echo "************Opening Producer Console***********************"
start /d "%KF_ROOT_PATH%" bin\windows\kafka-console-producer.bat --broker-list localhost:9092 --topic %topic%
echo "Successfully opened kafka producer console"
pause
echo "************Opening Consumer Console***********************"
start /d "%KF_ROOT_PATH%" bin\windows\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic %topic% --from-beginning
echo "Successfully opened kafka consumer console"
pause
echo "************Enabling Kafdrop Viewer***********************"
start /d "%KFDROP_PATH%" %KF_JAVA_HOME%\java -jar kafdrop-3.30.0.jar --server.port=9001 --management.server.port=9001 --kafka.brokerConnect=localhost:9092
echo "************Kafdrop Viewer (http://localhost:9001)***********************"
pause
