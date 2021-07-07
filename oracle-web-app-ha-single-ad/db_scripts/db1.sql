/*Copyright © 2020, Oracle and/or its affiliates. 
 All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
 */

CREATE USER dbfirst IDENTIFIED BY "${ATP_password}";

GRANT CREATE SESSION TO dbfirst;
GRANT CREATE TABLE TO dbfirst;
GRANT CREATE SEQUENCE TO dbfirst;
GRANT UNLIMITED TABLESPACE TO dbfirst;

CREATE TABLE "DBFIRST"."DEPT" (
  given_name  VARCHAR2(150) NOT NULL
);

INSERT INTO "DBFIRST"."DEPT"
VALUES ('Welcome to my custom web application. The application is running and can interact with the DB.');


commit;
exit;
