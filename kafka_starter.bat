@echo off
set KF_ROOT_PATH=D:\Applns\kafka_2.12-2.3.0
echo %KF_ROOT_PATH%
echo "************Starting Zookeeper***********************"
start /d  "%KF_ROOT_PATH%" bin\windows\zookeeper-server-start.bat config/zookeeper.properties
echo "************Zookeeper is up***********************"
echo "************Starting Kafka***********************"
pause
start /d "%KF_ROOT_PATH%" bin\windows\kafka-server-start.bat config/server.properties
echo "************Create topic and press any key to continue***********************"
set /p topic=Enter Topic name: 
echo %topic%
pause
echo "************Created topic***********************"
start /d "%KF_ROOT_PATH%" bin\windows\kafka-topics.bat --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic %topic%
echo "Created topic Successfully"
pause
echo "************Opening Producer Console***********************"
start /d "%KF_ROOT_PATH%" bin\windows\kafka-console-producer.bat --broker-list localhost:9092 --topic %topic%
echo "Successfully opened Producer Console"
pause
echo "************Opening Consumer Bat***********************"
start /d "%KF_ROOT_PATH%" bin\windows\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic %topic% --from-beginning
echo "Successfully opened Consumer Console"
pause
echo "************Enabling Kafdrop Viewer***********************"
set KF_JAVA_HOME=%KF_ROOT_PATH%\jdk-11.0.5_windows-x64_bin\bin
set KFDROP_PATH=%KF_ROOT_PATH%\kafdrop
echo %KFDROP_PATH%
echo %KF_JAVA_HOME%
start /d "%KFDROP_PATH%" %KF_JAVA_HOME%\java -jar kafdrop-3.13.0.jar
pause
