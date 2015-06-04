DROP TABLE CISDB.TACISASSET;

CREATE TABLE CISDB.TACISASSET 
( 
  FIIDASSET BIGINT(19) NOT NULL AUTO_INCREMENT
, FIIDLEDGER INT(10) NOT NULL 
, FCSUBCLASS VARCHAR(2) NOT NULL 
, FCDESCRIPTION VARCHAR(100) NOT NULL 
, FCBRAND VARCHAR(50) NULL DEFAULT 'Sin marca' 
, FCMODEL VARCHAR(50) NULL DEFAULT 'Sin modelo' 
, FCSERIALNUMBER VARCHAR(50) NULL DEFAULT 'Sin numero de serie' 
, FCMATERIAL VARCHAR(50) NULL 
, FCCOLOR VARCHAR(50) NULL 
, FCSUPPLIER VARCHAR(50) NULL DEFAULT 'Proveedor no identificado' 
, FCGENERALMANAGER VARCHAR(100) NULL 
, FCDIRECTLYRESPONSIBLE VARCHAR(100) NULL 
, FITAG BIGINT(19) NOT NULL 
, FCBILL VARCHAR(30) NULL DEFAULT 'Sin factura' 
, FDBILLINGDATE DATE NULL DEFAULT '2015-06-01' 
, FCLOCATION VARCHAR(50) NULL 
, FDUSEDATE DATE NULL DEFAULT '2015-06-01' 
, FNPRICE DECIMAL(10, 2) NOT NULL DEFAULT 0.00 
, FCGENERALLOCATION VARCHAR(50) NULL 
, FCSECURE VARCHAR(50) NULL 
, FDREGISTERDATE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
, FDLASTUPDATE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
, CONSTRAINT PRIMARY KEY ( FIIDASSET ) );

ALTER TABLE CISDB.TACISASSET ADD CONSTRAINT TABLE1_FK1 FOREIGN KEY ( FIIDLEDGER, FCSUBCLASS )
 REFERENCES CISDB.CTCISLEDGER ( FIIDLEDGER,  FCSUBCLASS );

CREATE UNIQUE INDEX TACISASSET_INDEX1 ON CISDB.TACISASSET ( FIIDASSET ASC);

CREATE INDEX TACISASSET_INDEX2 ON CISDB.TACISASSET ( FIIDLEDGER ASC, FCSUBCLASS ASC);

CREATE UNIQUE INDEX TACISASSET_INDEX3 ON CISDB.TACISASSET ( FITAG ASC);