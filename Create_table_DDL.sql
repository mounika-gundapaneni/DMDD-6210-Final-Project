SET SERVEROUT ON;

DECLARE record_count NUMBER;
BEGIN

-- create table PACKAGE_DEALS if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'PACKAGE_DEALS';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('PACKAGE_DEALS Table already exists');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');        
ELSE
    execute immediate 'CREATE table PACKAGE_DEALS (
    package_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 400 INCREMENT BY 1) NOT NULL,
    package_description VARCHAR(50) NOT NULL,
    package_cost NUMBER NOT NULL,
    CONSTRAINT PACKAGE_DEALS_PK PRIMARY KEY(package_ID),
    CONSTRAINT PACKAGE_DEALS_UNIQUE_DESC UNIQUE (package_description)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE PACKAGE_DEALS CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('------------------------------------------');      
END if;

-- create table CUSTOMER_INFO if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'CUSTOMER_INFO';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('CUSTOMER_INFO Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
ELSE
    execute immediate 'CREATE table CUSTOMER_INFO (
    customer_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 500 INCREMENT BY 1) NOT NULL,
    customer_fname VARCHAR(25) NOT NULL,
    customer_lname VARCHAR(25) NOT NULL,
    customer_gender CHAR(1) NOT NULL,
    customer_addressLine1 VARCHAR(50) NOT NULL,
    customer_city VARCHAR(20) NOT NULL,
    customer_state VARCHAR(20) NOT NULL,
    customer_zipCode VARCHAR(5) NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(20) NOT NULL,
    customer_isMember CHAR(1) NOT NULL,
    customer_ID_proof VARCHAR(50),
    customer_numberOfVisits NUMBER NOT NULL,
    CONSTRAINT CUSTOMER_INFO_PK PRIMARY KEY(customer_ID),
    CONSTRAINT CUSTOMER_INFO_UNIQUE UNIQUE (customer_email,customer_phone)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE CUSTOMER_INFO CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;


-- create table ROOM_TYPE if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'ROOM_TYPE';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('ROOM_TYPE Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    ELSE
    execute immediate 'CREATE table ROOM_TYPE (
    room_type_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    room_type VARCHAR(25) NOT NULL,
    room_cost NUMBER NOT NULL,
    max_persons NUMBER NOT NULL,
    CONSTRAINT ROOM_TYPE_PK PRIMARY KEY(room_type_ID),
    CONSTRAINT ROOM_TYPE_UNIQUE UNIQUE (room_type)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE ROOM_TYPE CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;


-- create table ROOM if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'ROOM';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('ROOM Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    ELSE
    execute immediate 'CREATE table ROOM (
    room_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 500 INCREMENT BY 1) NOT NULL,
    hotel_ID NUMBER NOT NULL,
    room_type_ID NUMBER NOT NULL,
    room_number VARCHAR(10) NOT NULL,
    room_availability VARCHAR(1) NOT NULL,
    CONSTRAINT ROOM_PK PRIMARY KEY(room_ID),
    CONSTRAINT ROOM_FK_1 FOREIGN KEY(room_type_ID) REFERENCES ROOM_TYPE(room_type_ID),
    CONSTRAINT ROOM_UNIQUE UNIQUE (room_number)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE ROOM CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;


-- create table FEEDBACK if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'FEEDBACK';
IF(record_count > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('FEEDBACK Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');
    ELSE
    execute immediate 'CREATE table FEEDBACK (
    feedback_ID NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT BY 1) NOT NULL,
    booking_ID NUMBER NOT NULL,
    feedback VARCHAR(250) NOT NULL,
    CONSTRAINT FEEDBACK_PK PRIMARY KEY(feedback_ID)
    )';
     DBMS_OUTPUT.PUT_LINE('TABLE FEEDBACK CREATED SUCCESSFULLY');
     DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
END IF;


-- create table EMPLOYEE_INFO if doesn't exists
SELECT count(*) into record_count FROM user_tables where table_name = 'EMPLOYEE_INFO';
IF(record_count > 0) THEN
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE_INFO Table already exists');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');        
ELSE
    execute immediate 'CREATE table EMPLOYEE_INFO (
  employee_ID NUMBER GENERATED ALWAYS as IDENTITY(START with 801 INCREMENT by 1),
  hotel_ID NUMBER,
  employee_fname VARCHAR(25) not null,
  employee_lname VARCHAR(25) not null,
  employee_DOB DATE not null,
  employee_gender CHAR(1) not null,
  employee_addressLine1 VARCHAR(50) not null,
  employee_city VARCHAR(20) not null,
  employee_state VARCHAR(20) not null,
  employee_zipCode VARCHAR(5) not null,
  employee_email VARCHAR(50) not null,
  employee_phone VARCHAR(20) not null,
  employee_designation VARCHAR(25) not null,
  employee_salary NUMBER not null,
  employee_ID_type VARCHAR(50) not null,
  employee_ID_number NUMBER not null,
  CONSTRAINT EMPLOYEE_INFO_PK PRIMARY KEY(employee_ID))';
  DBMS_OUTPUT.PUT_LINE('TABLE EMPLOYEE_INFO CREATED SUCCESSFULLY');
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------');      
end if;
END;
/
