--------------------------------------------------------
--  DDL for Table MENUCATEGORY
--------------------------------------------------------

  CREATE TABLE "STARBUCKS"."MENUCATEGORY" 
   (	"CATEGORYID" NUMBER, 
	"TYPE" VARCHAR2(100 BYTE), 
	"CATEGORY" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into STARBUCKS.MENUCATEGORY
SET DEFINE OFF;
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (3,'D','브루드 커피');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (4,'D','스타벅스 피지오');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (5,'D','기타 제조 음료');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (6,'D','블렌디드');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (7,'D','스타벅스 주스(병음료)');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (8,'D','에스프레소');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (9,'D','콜두 브루');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (10,'D','프라푸치노');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (11,'D','티');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (12,'F','케이크');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (13,'F','브레드');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (14,'F','따뜻한 푸드');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (15,'F','아이스크림');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (16,'F','샌드위치&샐러드');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (17,'F','스낵&미니디저트');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (18,'F','과일&요거트');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (19,'P','스테인리스 텀블러');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (20,'P','커피 용품');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (21,'P','패키지 티(타바나)');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (22,'P','머그');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (23,'P','글라스');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (24,'P','악세서리');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (25,'P','플라스틱 텀블러');
Insert into STARBUCKS.MENUCATEGORY (CATEGORYID,TYPE,CATEGORY) values (26,'P','보온병');
--------------------------------------------------------
--  DDL for Index CATEGORY_CI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STARBUCKS"."CATEGORY_CI_PK" ON "STARBUCKS"."MENUCATEGORY" ("CATEGORYID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table MENUCATEGORY
--------------------------------------------------------

  ALTER TABLE "STARBUCKS"."MENUCATEGORY" ADD CONSTRAINT "CATEGORY_CI_PK" PRIMARY KEY ("CATEGORYID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;


commit;