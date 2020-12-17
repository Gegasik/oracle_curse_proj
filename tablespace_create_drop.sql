create tablespace cinema_ts
datafile 'E:\cinema_ts_datafile\cimema_ts.dbf'
size 10 m
autoextend on next 500k
maxsize 100m
extent management local;

drop tablespace cinema_ts;

ALTER DATABASE DATAFILE 'E:\cinema_ts_datafile\CIMEMA_TS.DBF' 500m;