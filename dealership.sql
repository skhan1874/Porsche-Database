
CREATE TABLE DEALERSHIP(
	dealer_ID Int PRIMARY KEY,
	dealer_phone VARCHAR2(20),
	street_number VARCHAR2(6),
	street_address VARCHAR2(50),
	city VARCHAR2(100),
	State VARCHAR2(50),
	zip CHAR(5));

INSERT INTO DEALERSHIP VALUES ('1223', '800-555-9923', '1000', 'Hilltop Circle', 'Catonsville', 'Maryland', '21250');
_____________________________________________________________________________________________

CUSTOMER, ADDRESS, EMAIL, PHONE TABLES

CREATE TABLE CUSTOMER (
	customer_ID Int primary key,
	customer_fname VARCHAR2(50),
	customer_lname VARCHAR2(50));

INSERT INTO CUSTOMER VALUES (521935, 'Saif', 'Khan');
INSERT INTO CUSTOMER VALUES (254458, 'Kevin', 'Shields');
INSERT INTO CUSTOMER VALUES (721003, 'Rabindra', 'Singh');
INSERT INTO CUSTOMER VALUES (925117, 'Andrew', 'Stine');


CREATE TABLE CUSTOMER_ADDRESS(
	address_ID Int primary key,
	customer_ID Int,
	street_number varchar2(6),
	street_address varchar2(50),
	city varchar2(100),
	State VARCHAR2(50),
	zip char(5),
	foreign key(customer_ID) references CUSTOMER(customer_ID));

INSERT INTO CUSTOMER_ADDRESS VALUES (1, 521935, 3819, 'Main St', 'Laurel', 'Maryland', '20797');
INSERT INTO CUSTOMER_ADDRESS VALUES (2, 254458, 10125, 'Junction Dr', 'Annapolis Junction', 'Maryland', '20701');
INSERT INTO CUSTOMER_ADDRESS VALUES (3, 721003, 8647, 'West Tallwood Ln', 'Annapolis', 'Maryland', '21411');
INSERT INTO CUSTOMER_ADDRESS VALUES (4, 925117, 6211, 'Glen Ridge Ave', 'Towson', 'Maryland', '21252');


CREATE TABLE CUSTOMER_EMAIL (
	email_ID primary key,  
	customer_ID Int,
	first_email VARCHAR2(100),
	second_email VARCHAR2(100) Null,
	FOREIGN KEY (customer_ID) REFERENCES CUSTOMER(customer_ID));

INSERT INTO CUSTOMER_EMAIL VALUES (1, 521935, 'email.1@team2.com', 'other-email.1@team2.com');
INSERT INTO CUSTOMER_EMAIL VALUES (2, 254458, 'email.2@team2.com', Null);
INSERT INTO CUSTOMER_EMAIL VALUES (3, 721003, 'email.3@team2.com',Null );
INSERT INTO CUSTOMER_EMAIL VALUES (4, 925117, 'email.4@team2.com', 'other-email.4@team2.com');


CREATE TABLE CUSTOMER_PHONE (
	phone_ID int primary key,
	customer_ID Int,
	main_phone VARCHAR2(20),
	second_phone VARCHAR2(20) Null,
	FOREIGN KEY (customer_ID) REFERENCES CUSTOMER(customer_ID));

INSERT INTO CUSTOMER_PHONE VALUES (1, 521935, '301-555-8232', NULL);
INSERT INTO CUSTOMER_PHONE VALUES (2, 254458, '410-555-3961', '301-555-9872');
INSERT INTO CUSTOMER_PHONE VALUES (3, 521935,'443-999-8322', '663-832-0083');
INSERT INTO CUSTOMER_PHONE VALUES (4, 721003, '663-555-1936','301-555-8880');
INSERT INTO CUSTOMER_PHONE VALUES (5, 925117, '301-555-0034', '443-555-5555');
_____________________________________________________________________________________________

DEPARTMENT, SALES, FINANCE, SERVICE, PARTS TABLES

CREATE TABLE DEPARTMENT(
	dept_ID Int PRIMARY KEY,
	dealer_ID Int,
	dept_phone VARCHAR2(20),
	foreign key(dealer_ID) references DEALERSHIP(dealer_ID));

INSERT INTO DEPARTMENT VALUES ('0083','1223', '800-999-0001');
INSERT INTO DEPARTMENT VALUES ('0084','1223', '800-999-0002');
INSERT INTO DEPARTMENT VALUES ('0085','1223', '800-999-0003');
INSERT INTO DEPARTMENT VALUES ('0086','1223', '800-999-0004');


CREATE TABLE SALES_DEPARTMENT (
	Sdept_ID Int,
	sales_date date primary key,
	vehicles_sold SMALLint,
	commission decimal(10, 2),
	warranties SMALLint,
	Foreign key (Sdept_ID) references DEPARTMENT(dept_ID));

INSERT INTO SALES_DEPARTMENT VALUES ('0085', date '2022-10-08', '34', '6992.87', '20');
INSERT INTO SALES_DEPARTMENT VALUES ('0085', date '2022-10-09', '12', '2384', '2');
INSERT INTO SALES_DEPARTMENT VALUES ('0085', date '2022-10-10', '56', '16262.44', '35');


CREATE TABLE FINANCE_DEPARTMENT (
	Fdept_ID Int,
	finance_date date primary key,
	credit_applications int,
	Foreign key (Fdept_ID) references DEPARTMENT(dept_ID));

INSERT INTO FINANCE_DEPARTMENT VALUES ('0086', date '2022-10-08','24');
INSERT INTO FINANCE_DEPARTMENT VALUES ('0086', date'2022-10-09','12');
INSERT INTO FINANCE_DEPARTMENT VALUES ('0086', date'2022-10-10','29');


CREATE TABLE SERVICE_DEPARTMENT (
	service_ID int primary key,
	SEdept_ID Int,
	service_type VARCHAR2(30),
	service_notes VARCHAR2(140),
	Foreign key (SEdept_ID) references DEPARTMENT(dept_ID));

INSERT INTO SERVICE_DEPARTMENT VALUES (2,'0083', 'Oil Change', 'Customer needs new oil');
INSERT INTO SERVICE_DEPARTMENT VALUES (17,'0083', 'Oil Change', 'Customer needs tire rotation');
INSERT INTO SERVICE_DEPARTMENT VALUES (9,'0083', 'Rear Axle Fix', 'Customer needs needs to replace both rear axles');


CREATE TABLE PARTS_DEPARTMENT (
	parts_ID primary key,
	Pdept_ID Int,
	itemes_sold VARCHAR2(30),
	Foreign key (Pdept_ID) references DEPARTMENT(dept_ID));

INSERT INTO PARTS_DEPARTMENT VALUES (6,'0084', 'Oil Filter');
INSERT INTO PARTS_DEPARTMENT VALUES (2, '0084', 'Car Seat Covers');
INSERT INTO PARTS_DEPARTMENT VALUES (88, '0084', 'Key Chain');
INSERT INTO PARTS_DEPARTMENT VALUES (52,'0084', 'Key Chain');
INSERT INTO PARTS_DEPARTMENT VALUES (10, '0084', 'Paint Correction');
_____________________________________________________________________________________________

EMPLOYEE TABLE

CREATE TABLE EMPLOYEE (
	emp_ID Int PRIMARY KEY,
	dept_ID Int,
	emp_fname VARCHAR2(50),
	emp_lname VARCHAR2(50),
	main_phone VARCHAR2(20),
	secondary_phone VARCHAR2(20) NUll,
	emp_email VARCHAR2(100),
	street_number varchar2(6),
	street_address VARCHAR2(50),
	city VARCHAR2(50),
	State varchar2(50),
	zip CHAR(5),
	hire_date date, 
	foreign key(dept_ID) references DEPARTMENT(dept_ID));

INSERT INTO EMPLOYEE VALUES (223296,'0083','Payton','Dawson','443-555-9932',NULL,'email.1@dealership.com',67,'Main St','Laurel','Maryland','20797', date '2017-07-06');
INSERT INTO EMPLOYEE VALUES(165243,'0084','Reese','Hancock','301-555-9933','410-555-0077','email.2@dealership.com',67,'Main St','Laurel', 'Maryland','20797', date '2002-08-23');
INSERT INTO EMPLOYEE VALUES (21345,'0085','Cale','Hubbard','663-555-9934','443-555-0078','email.3@dealership.com',3819,'Hope Ave','Jessup','Maryland','20794',date '2016-04-09');
INSERT INTO EMPLOYEE VALUES(276432, '0085','Nora', 'Smith','410-555-9935','443-555-0079','email.4@dealership.com',62,'Baltimore St','Baltimore','Maryland','21206',date '2020-09-08');
_____________________________________________________________________________________________

VEHICLE TABLE AND ALTERATIONS | CAR, SUV, TRUCK

CREATE TABLE VEHICLE(
	stock_number Int primary key,
	dealer_ID Int,
	vehicle_year smallint,
	vehicle_make VARCHAR2(25),
	vehicle_model VARCHAR2(100),
	vehicle_trim VARCHAR2(100),
	vehicle_price decimal (10, 2),
	exterior_color VARCHAR2(50),
	interior_color VARCHAR2(50),
	foreign key(dealer_ID) references DEALERSHIP(dealer_ID));

ALTER table VEHICLE
add vehicle_miles int not Null;

ALTER table VEHICLE
add vehicle_condition VARCHAR2(7) not Null;

ALTER table VEHICLE
add fuel_type VARCHAR2(20) not Null;

ALTER table VEHICLE
add vehicle_status VARCHAR2(20) not Null;

ALTER table VEHICLE
add vehicle_type VARCHAR2(20) not Null;

INSERT INTO VEHICLE VALUES (82774,1223,2023,'GMC','Hummer','EV',276080,'Void Black','Black',438,'Used','Electric','Available','Truck');
INSERT INTO VEHICLE VALUES (84453,1223,2018,'Lamborghini','Huracan','Coupe',322000,'Nero Helene Metallic','Red',6313,'Used','Gas','Available','Car');
INSERT INTO VEHICLE VALUES (52061,1223,2022,'Porsche','718','Cayman',91930,'White','Gray',17455,'Used','Gas','Available','Car');
INSERT INTO VEHICLE VALUES (83551,1223,2022,'Porsche','Macan','S',99180,'Volcano Gray Metallic','Gray',62,'New','Gas','Available','SUV');
INSERT INTO VEHICLE VALUES (84093,1223,2022,'Porsche','Panamera','4 E-Hybrid Platinum Edition',130680,'Carrara White Metallic','White',18,'New','Hybrid','Available','Car');
INSERT INTO VEHICLE VALUES (87551,2022,'Porsche','911','GT3 RS',290940,'White','Red',12215,'Used','Gas','Available','Car');
INSERT INTO VEHICLE VALUES (89495,1223,2023,'Porsche','911','Turbo S',302540,'Carrara White Metallic','Red',19,'New','Gas','Available','Car');


CREATE TABLE CAR (
	Cstock_number Int,
	top_speed Varchar2(10),
	trunk_space VARCHAR2(10),
	Foreign key (Cstock_number) references VEHICLE(stock_number));

INSERT INTO CAR VALUES (84453,'211 MPH','4 Ft');
INSERT INTO CAR VALUES (52061,'182 MPH','9 Ft');
INSERT INTO CAR VALUES (84093,'169 MPH','52 Ft');
INSERT INTO CAR VALUES (87551,'185 MPH','11 Ft');
INSERT INTO CAR VALUES (89495,'205 MPH','11 Ft');


CREATE TABLE SUV (
	Sstock_number Int,
	cargo_capacity varchar2(10),
	row_numbers smallint,
	ground_clearance varchar2(10),
	Foreign key (Sstock_number) references VEHICLE(stock_number));

INSERT INTO SUV VALUES  (83551,‘53 ft’, 2, '7.1 inches');


CREATE TABLE TRUCK (
	Tstock_number Int,
	bed_size varchar2(10),
	towing_capacity varchar2(10),
	ground_clearance varchar2(10),
	Foreign key (Tstock_number) references VEHICLE(stock_number));

INSERT INTO Truck VALUES  (82774,'54 in’,'7500 lbs','16 inches');
_____________________________________________________________________________________________
ORDERS TABLE

CREATE TABLE ORDERS (
	order_ID Int PRIMARY KEY,
	order_date DATE,
	order_comments VARCHAR2(140),
	customer_ID Int,
	emp_ID Int,
	FOREIGN KEY (customer_ID) REFERENCES CUSTOMER(customer_ID),
	FOREIGN KEY (emp_ID) REFERENCES EMPLOYEE(emp_ID));

INSERT INTO ORDERS VALUES (12, date '2022-10-08', 'Purchasing vehicle cash', 521935, 21345);
INSERT INTO ORDERS VALUES (13, date '2022-10-08', 'Test drove Porsche 911 GT3', 254458, 276432);
INSERT INTO ORDERS VALUES (14, date '2022-10-09', 'Looking at purchasing 2 vehicles',  721003, 21345);
INSERT INTO ORDERS VALUES (15, date '2022-10-09', 'Looking at Macan', 925117, 21345);
_____________________________________________________________________________________________

INVOICE TABLE

CREATE TABLE INVOICE (
	invoice_ID Int PRIMARY KEY,
	dealer_ID Int,
	order_ID Int,
	stock_number Int,
	payment int,
	FOREIGN KEY (dealer_ID) REFERENCES DEALERSHIP(dealer_ID),
	FOREIGN KEY (order_ID) REFERENCES ORDERS(order_ID),
	FOREIGN KEY (stock_number) REFERENCES VEHICLE(stock_number));

INSERT INTO INVOICE VALUES (443, 1223, 12, 84093, 130680);
INSERT INTO INVOICE VALUES (445, 1223, 13, 87551, 290940);
INSERT INTO INVOICE VALUES (456, 1223, 14,  52061, 91930);
INSERT INTO INVOICE VALUES (457, 1223, 14,  89495, 302540);
INSERT INTO INVOICE VALUES (656, 1223, 15, 83551, 99180);


