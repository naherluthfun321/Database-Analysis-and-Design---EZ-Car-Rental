 --Created user 1: luthfun
CREATE USER luthfun 
    IDENTIFIED BY luthfun 
    DEFAULT TABLESPACE users 
    TEMPORARY TABLESPACE temp
    QUOTA unlimited ON users;  
    
--Created user 1: naher
CREATE USER naher 
    IDENTIFIED BY naher 
    DEFAULT TABLESPACE users 
    TEMPORARY TABLESPACE temp
    QUOTA unlimited ON users;      

--Verify the User exists by running a query on the DBA_USERS table which contains all user information
SELECT username, account_status, default_tablespace, temporary_tablespace 
FROM DBA_USERS WHERE username='LUTHFUN' OR username='NAHER';
    
--Connect to database using new user
CONNECT LUTHFUN/luthfun;

-- Fix: Grant CREATE SESSION privilege to luthfun 
GRANT CREATE SESSION TO luthfun;

--Connect to database using new user
CONNECT LUTHFUN/luthfun;

--Perform select query on an existing schema table
SELECT * FROM DBDeveloper1.Customer;

--GRANT SELECT object privilege to access the CUSTOMER table for luthfun:
GRANT SELECT ON DBDeveloper1.Customer TO luthfun; -- Object Privilege

--GRANT SELECT ANY TABLE system privilege to luthfun:
GRANT SELECT ANY TABLE TO luthfun; -- System Privilege

--Perform delete operation on an existing schema table
DELETE FROM DBDeveloper1.Customer WHERE DRIVERLICENSENUM = '242341678';

-- Grant OBJECT privilege to single user
GRANT DELETE ON DBDeveloper1.Customer TO luthfun; -- Object Privilege

-- Grant SYSTEM privilege to single user
GRANT DELETE ANY TABLE TO luthfun; -- System Privilege

--Perform delete operation on an existing schema table
DELETE FROM DBDeveloper1.Customer WHERE DRIVERLICENSENUM = '242341678';

--Connect as user luthfun

-- Create table statement 
CREATE TABLE Department (
    Dept_ID NUMBER(4) PRIMARY KEY, 
    Dept_Name VARCHAR2(20) NOT NULL
);

-- Grant OBJECT privilege to single user
GRANT CREATE TABLE TO luthfun; -- System Privilege
-- Grant SYSTEM privilege to single user
GRANT CREATE ANY TABLE TO luthfun; -- System Privilege

-- Create table statement 
CREATE TABLE Department (
    Dept_ID NUMBER(4) PRIMARY KEY, 
    Dept_Name VARCHAR2(20) NOT NULL
);
