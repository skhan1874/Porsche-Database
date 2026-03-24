CREATE TABLE DEALERSHIP(
	dealer_ID Int PRIMARY KEY,
	dealer_phone VARCHAR2(20),
	street_number VARCHAR2(6),
	street_address VARCHAR2(50),
	city VARCHAR2(100),
	State VARCHAR2(50),
	zip CHAR(5));

INSERT INTO DEALERSHIP VALUES ('1223', '800-555-9923', '1000', 'Hilltop Circle', 'Catonsville', 'Maryland', '21250');
