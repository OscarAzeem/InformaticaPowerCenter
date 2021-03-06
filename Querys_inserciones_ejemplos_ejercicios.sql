-- General Querys
-- Create Table TARGET_MYSQLLOCATION on the Oracle server.
-- Such table relies on hr.location from the MYSQL server

CREATE TABLE TARGET_MYSQLLOCATION
(
LocationID NUMBER(10),
Name varchar2(50) NOT NULL,
CostRate NUMBER(35) NOT NULL,
Availability NUMBER(8,2) NOT NULL,
ModifiedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


---  CREATE TABLE: COMPOUND JOB
-- JOBS AND JOB_HISTORY

select dbms_metadata.get_ddl('TABLE', table_name) from user_tables;

-- CREATE AS FIRST TABLE
-- ALTER TABLE AND ADD THE LAST COLUMN FROM JOB_HISTORY

CREATE TABLE TARGET_COMPOUNDJOB AS SELECT * FROM JOBS WHERE 1=0;

ALTER TABLE TARGET_COMPOUNDJOB ADD(
"DEPARTMENT_ID" NUMBER(4,0)
);


-- TEMP

select * from TARGET_MYSQLLOCATION;

select COUNT(*) from TARGET_MYSQLLOCATION;

---  CREATE TABLE: COMPOUND JOB
-- JOBS AND JOB_HISTORY

select dbms_metadata.get_ddl('TABLE', table_name) from user_tables;

-- CREATE AS FIRST TABLE
-- ALTER TABLE AND ADD THE LAST COLUMN FROM JOB_HISTORY

CREATE TABLE TARGET_COMPOUNDJOB AS SELECT * FROM JOBS WHERE 1=0;

ALTER TABLE TARGET_COMPOUNDJOB ADD(
"DEPARTMENT_ID" NUMBER(4,0)
);

SELECT COUNT(*) FROM TARGET_COMPOUNDJOB

SELECT * FROM TARGET_COMPOUNDJOB

SELECT * FROM JOBS ORDER BY JOB_ID

SELECT * FROM JOB_HISTORY ORDER BY JOB_ID

select * from COuntries;

select * from COuntries
order by REGION_ID;

DROP TABLE G_TGT_COUNTRIES_COUNTRIESSQ;

CREATE TABLE G_TGT_COUNTRIES_COUNTRIESSQ 
AS SELECT * FROM COUNTRIES
where 1=0;

SELECT * FROM G_TGT_COUNTRIES_COUNTRIESSQ 

TRUNCATE TABLE G_TGT_COUNTRIES_COUNTRIESSQ 

ALTER TABLE G_TGT_COUNTRIES_COUNTRIESSQ 
add fecha TIMESTAMP;

COMMIT;

select dbms_metadata.get_ddl('TABLE', table_name) from user_tables;



  CREATE TABLE "HR"."G_TGT_COUNTRIES_COUNTRIESSQ" 
   (	"COUNTRY_ID" CHAR(2) CONSTRAINT "COUNTRY_ID_NN2" NOT NULL ENABLE, 
	"COUNTRY_NAME" VARCHAR2(40), 
	"REGION_ID" NUMBER, 
	 CONSTRAINT "COUNTRY_C_ID_PK2" PRIMARY KEY ("COUNTRY_ID") ENABLE, 
	 CONSTRAINT "COUNTR_REG_FK2" FOREIGN KEY ("REGION_ID")
	  REFERENCES "HR"."REGIONS" ("REGION_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 PCTTHRESHOLD 50


INSERT INTO G_TGT_COUNTRIES_COUNTRIESSQ VALUES ('AZ','Azeemland',1,CURRENT_TIMESTAMP);


select CURRENT_TIMESTAMP from dual;

--------------------------------------
select count(*) from target_mysqllocation;

select * from target_mysqllocation;

ALTER TABLE METADATA_IPC RENAME COLUMN TGT_SUCESS_ROWS TO TGT_SUCCESS_ROWS;

ALTER TABLE METADATA_IPC MODIFY SRC_TABLE_NAME varchar2(50);

ALTER TABLE METADATA_IPC MODIFY TGT_TABLE_NAME varchar2(50);

select dbms_metadata.get_ddl('TABLE', table_name) from user_tables;



------------------------------------------------
------- CREATING A METADATAIPC TABLE
------------------------------------------------

CREATE TABLE METADATA_IPC(
MAPPING_NAME varchar2(50),
WORKFLOW_NAME varchar2(50),
SRC_TABLE_NAME varchar2(50),
SRC_SUCCESS_ROWS integer,
SRC_FAILED_ROWS integer,
TGT_TABLE_NAME varchar2(50),
TGT_SUCCESS_ROWS integer,
TGT_FAILED_ROWS integer,
EXP_TRANS_ERRORS integer,
ERROR_CODE integer,
ERROR_FIRST_MSG varchar2(600),
ERROR_MSG varchar2(600),
TIME_START TIMESTAMP,
TIME_END TIMESTAMP,
DURATION_WF TIMESTAMP
)

DROP TABLE METADATA_IPC

select * from METADATA_IPC


select 0 from dual; 

DROP TABLE G_TGT_LOCATION_FROM_MYSQL

CREATE TABLE G_TGT_LOCATION_FROM_MYSQL AS SELECT * FROM LOCATIONS WHERE 1=1;

SELECT * FROM G_TGT_LOCATION_FROM_MYSQL

CREATE TABLE G_TGT_LOCATION_FROM_MYSQL
(
LocationID NUMBER(10),
Name varchar2(50) NOT NULL,
CostRate NUMBER(35) NOT NULL,
Availability NUMBER(8,2) NOT NULL,
ModifiedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

SELECT * FROM G_TGT_LOCATION_FROM_MYSQL





















------------------------


SELECT * FROM METADATA_IPC;

CREATE TABLE METADATA_IPC(
MAPPING_NAME varchar2(50),
WORKFLOW_NAME varchar2(50),
SRC_TABLE_NAME varchar2(50),
SRC_SUCCESS_ROWS integer,
SRC_FAILED_ROWS integer,
TGT_TABLE_NAME varchar2(50),
TGT_SUCCESS_ROWS integer,
TGT_FAILED_ROWS integer,
EXP_TRANS_ERRORS integer,
ERROR_CODE integer,
ERROR_FIRST_MSG varchar2(600),
ERROR_MSG varchar2(600),
TIME_START TIMESTAMP,
TIME_END TIMESTAMP,
DURATION_WF number(38,10)
)

DROP TABLE METADATA_IPC

select * from METADATA_IPC

SELECT * FROM G_TGT_LOCATION_FROM_MYSQL

DELETE FROM METADATA_IPC

commit;