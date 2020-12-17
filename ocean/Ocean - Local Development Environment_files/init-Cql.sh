

CREATE KEYSPACE ocean WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};

use ocean;

drop table telemetry;
drop table telemetry_60s;
drop table telemetry_300s;
drop table telemetry_900s;
drop table telemetry_3600s;
drop table telemetry_86400s;
drop table error;

create table telemetry (
  "messageId" text,
  "agentId" text,
  "deviceId" text,
  "measurePoint" text,
  "string_value" text,
  "boolean_value" boolean,
  "double_value" double,
  "ts" timestamp,
  PRIMARY KEY (("deviceId","measurePoint"), "ts")
)
WITH CLUSTERING ORDER BY ("ts" DESC);

create table telemetry_60s (
  "deviceId" text,
  "pointName" text,
  "ts" timestamp,
"string_value" text,
  "boolean_value" boolean,
  "double_value" double,
  PRIMARY KEY (("deviceId","pointName"), "ts")
)
WITH CLUSTERING ORDER BY ("ts" DESC);


create table telemetry_300s (
  "deviceId" text,
  "pointName" text,
  "ts" timestamp,
  "string_value" text,
  "boolean_value" boolean,
  "double_value" double,
  PRIMARY KEY (("deviceId","pointName"), "ts")
)
WITH CLUSTERING ORDER BY ("ts" DESC);

create table telemetry_900s (
  "deviceId" text,
  "pointName" text,
  "ts" timestamp,
"string_value" text,
  "boolean_value" boolean,
  "double_value" double,
  PRIMARY KEY (("deviceId","pointName"), "ts")
)
WITH CLUSTERING ORDER BY ("ts" DESC);

create table telemetry_3600s (
  "deviceId" text,
  "pointName" text,
  "ts" timestamp,
  "string_value" text,
  "boolean_value" boolean,
  "double_value" double,
  PRIMARY KEY (("deviceId","pointName"), "ts")
)
WITH CLUSTERING ORDER BY ("ts" DESC);

create table telemetry_86400s (
  "deviceId" text,
  "pointName" text,
  "ts" timestamp,
  "string_value" text,
  "boolean_value" boolean,
  "double_value" double,
  PRIMARY KEY (("deviceId","pointName"), "ts")
)
WITH CLUSTERING ORDER BY ("ts" DESC);

create table error (
  "messageId" text,
  "errorMessage" text,
  "ts" timestamp,
  PRIMARY KEY ("messageId", "ts")
)
WITH CLUSTERING ORDER BY ("ts" DESC);


alter table telemetry with default_time_to_live=1209600;
alter table telemetry_60s with default_time_to_live=1209600;
alter table telemetry_300s with default_time_to_live=1209600;
alter table telemetry_900s with default_time_to_live=1209600;
alter table telemetry_3600s with default_time_to_live=1209600;
alter table telemetry_86400s with default_time_to_live=1209600;
alter table error with default_time_to_live=1209600;
