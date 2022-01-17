CREATE SEQUENCE TEST_SEQUENCE;

SELECT NEXTVAL('TEST_SEQUENCE');

SELECT CURRVAL('TEST_SEQUENCE');

SELECT LASTVAL();

SELECT SETVAL('TEST_SEQUENCE',14);

SELECT NEXTVAL('TEST_SEQUENCE');

SELECT SETVAL('TEST_SEQUENCE',25,FALSE);


CREATE SEQUENCE IF NOT EXISTS TEST_SEQUENCE_2 INCREMENT 5;

SELECT NEXTVAL('TEST_SEQUENCE_2');

CREATE SEQUENCE IF NOT EXISTS TEST_SEQUENCE_3 
INCREMENT 50
MINVALUE 350
MAXVALUE 5000
START WITH 550


SELECT NEXTVAL('TEST_SEQUENCE_3');

CREATE SEQUENCE IF NOT EXISTS TEST_SEQUENCE_4 
INCREMENT 7
START WITH 33

SELECT NEXTVAL('TEST_SEQUENCE_4');

CREATE SEQUENCE IF NOT EXISTS employees_employeeid_seq
START WITH 10 OWNED BY employees.employeeid; 




INSERT INTO employees (lastname,firstname,title,reportsto)
values ('lavate','Harshala','manager',2);


alter table employees
alter column employeeid set default nextval('employees_employeeid_seq');


CREATE SEQUENCE IF NOT EXISTS orders_orderid_seq
START WITH 11078;

alter table orders
alter column orderid set default nextval('orders_orderid_seq');


ALTER SEQUENCE employees_employee_seq RESTART WITH 1000;
SELECT nextval('employees_employee_seq')

ALTER SEQUENCE orders_orderid_seq RESTART WITH 200000;
SELECT nextval('orders_orderid_seq');

ALTER SEQUENCE test_sequence RENAME TO test_sequence_1

ALTER SEQUENCE test_sequence_4  RENAME TO test_sequence_four

DROP SEQUENCE test_sequence_1

DROP SEQUENCE test_sequence_four


DROP TABLE IF EXISTS exes;

CREATE TABLE exes (
exid SERIAL,
name varchar(255)
);
INSERT INTO exes (name) VALUES ('Carrie') RETURNING exid


DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
petid SERIAL,
name varchar(255)
);

insert into pets (name) values ('harshala') returning petid;


CREATE VIEW customer_order_details AS
SELECT companyname, Orders.customerid, employeeid, orderdate, requireddate, shippeddate
Shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry,
order_details.*
FROM customers
JOIN orders on customers.customerid=orders.customerid
JOIN order_details on order_details.orderid=orders.orderid;


SELECT *
FROM customer_order_details
WHERE customerid='TOMSP';

CREATE VIEW supplier_order_details AS
SELECT companyname, suppliers.supplierid, Products.productid, productname,
Order_details.unitprice, quantity, discount, orders.*
FROM suppliers
JOIN products ON suppliers.supplierid=products.supplierid
JOIN order_details ON order_details.productid=products.productid
JOIN orders ON order_details.orderid=orders.orderid;

SELECT *  FROM supplier_order_details WHERE supplierid=5;



CREATE OR REPLACE VIEW customer_order_details AS
SELECT companyname, Orders.customerid,employeeid,requireddate,shippeddate,
Shipvia,freight,shipname,shipcity,shipregion,shippostalcode,shipcountry,
order_details.*,contactname
FROM customers
JOIN orders on customers.customerid=orders.customerid
JOIN order_details on order_details.orderid=orders.orderid;

CREATE OR REPLACE VIEW supplier_order_details AS
SELECT companyname,suppliers.supplierid,
Products.productid,productname,
Order_details.unitprice,quantity,discount,
orders.*,phone
FROM suppliers
JOIN products ON suppliers.supplierid=products.supplierid
JOIN order_details ON order_details.productid=products.productid
JOIN orders ON order_details.orderid=orders.orderid;

ALTER VIEW customer_order_details RENAME TO customer_order_detailed;

ALTER VIEW supplier_order_details RENAME TO supplier_orders;

CREATE OR REPLACE VIEW north_america_customers  AS
SELECT *
FROM customers
WHERE country in ('USA','Canada','Mexico')
WITH LOCAL CHECK OPTION;


INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','Germany','555-555-5555',null);


SELECT FROM north_america_customers
WHERE customerid=’CFDCM’;



CREATE OR REPLACE VIEW protein_products AS
SELECT * FROM products
WHERE categoryid in (4,6,8)
WITH LOCAL CHECK OPTION;

INSERT INTO protein_products
(productid,productname,supplierid,categoryid,discontinued)
VALUES (78,'Tasty Tea',12,1,0);