DROP TABLE IF EXISTS airports;
DROP TABLE IF EXISTS flight_data;
DROP TABLE IF EXISTS plane_data;

CREATE TABLE flight_data (
year int,
month int,
dom int,
dow int,
deptime int,
crsdeptime int,
arrtime int,
crsarrtime int,
ucar string,
flightnum int,
tailnum string,
actualelaptime int,
crselaptime int,
airtime int,
arrdelay int,
depdelay int,
origin string,
dest string,
dist int,
taxii int,
taxio int,
cancel int,
cancelcode string,
diverted int,
cardel int,
weatdel int,
nasdel int,
secdel int,
lateaircraftdelay int
)ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES
(
"separatorChar" = ","
)
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH '2005.csv' OVERWRITE INTO TABLE flight_data;


CREATE TABLE airports (
  Iata string,
  Airport string,
  City string,
  State string,
  Country string,
  Lat float,
  Long float
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar"     = '"'
)
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH 'airports.csv' OVERWRITE INTO TABLE airports;

CREATE plane_data (
    tailnum string,
    type string,
    man STRING,
    issue_date STRING,
    model STRING,
    status STRING,
    aircraft_type STRING,
    engine_type STRING,
    year INT
)ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES
(
    "separatorChar" = ","
)
tblproperties("skip.header.line.count"="1");

LOAD DATA LOCAL INPATH 'data/plane-data.csv' OVERWRITE INTO TABLE plane_data;
