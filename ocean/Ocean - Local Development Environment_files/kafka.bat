D:

REM clear kafka data, These are in the root directory of the drive letter where the kafka is located 
rd /s/q D:\tmp
rd /s/q D:\var
rd /s/q D:\logs

REM clear the data file generated when the program is running , These are in the root directory of the drive letter where the source code is located 
rd /s/q G:\tmp
rd /s/q G:\var
rd /s/q G:\logs	

REM enter kafka Installation path
REM cd D:\kafka\kafka_2.11-1.1.0
cd D:\kafka_2.12-2.4.1

set  createD=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1  --topic devices
set  createDKT=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --config retention.ms=-1 --topic devicesKTable
set  createT=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic telemetry

set  createA=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic agentAlert
set  createE=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic error

set  createHa=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic hallAlarm
set  createFa=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic floorAlarm
set  createBa=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic buildingAlarm
set  createSa=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic siteAlarm

set  createHt=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic hallTelemetry
set  createBt=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic buildingTelemetry
set  createSt=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic siteTelemetry

set  createT60=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic telemetry_60s
set  createT300=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic telemetry_300s
set  createT900=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic telemetry_900s
set  createT3600=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic telemetry_3600s
set  createT86400=bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic telemetry_86400s

start cmd /k bin\windows\zookeeper-server-start.bat config\zookeeper.properties

timeout /T 6

start cmd /k bin\windows\kafka-server-start.bat config\server.properties

timeout /T 5

call  %createD%
call  %createDKT%
call  %createT%
call  %createA%
call  %createE%
call  %createHa%
call  %createFa%
call  %createBa%
call  %createSa%
call  %createHt%
call  %createBt%
call  %createSt%
call  %createTC%
call  %createT60%
call  %createT300%
call  %createT900%
call  %createT3600%
call  %createT86400%

timeout /T -1












