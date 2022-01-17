DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
fieldname varchar(50) NOT NULL
);

INSERT INTO practices (practiceid,fieldname)
VALUES (1, null);
INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field1');
INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field2');

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
name varchar(25) NOT NULL
);

ALTER TABLE practices
DROP CONSTRAINT practices_pkey;

ALTER TABLE practices
ADD PRIMARY KEY (practiceid);

ALTER TABLE pets
DROP CONSTRAINT pets_pkey;

ALTER TABLE pets
ADD PRIMARY KEY (petid);


DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
	practicefield varchar(50) NOT NULL,
	employeeid integer NOT NULL,
	FOREIGN KEY (employeeid) REFERENCES employees(employeeid)
)


DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
)

ALTER TABLE practices
DROP CONSTRAINT practices_employeeid_fkey;

ALTER TABLE practices
ADD CONSTRAINT practices_employee_fkey
FOREIGN KEY (employeeid) REFERENCES employees(employeeid);

ALTER TABLE pets
DROP CONSTRAINT pets_customerid_fkey;

ALTER TABLE pets
ADD CONSTRAINT pets_customerid_fkey
FOREIGN KEY (customerid) REFERENCES customers(customerid);



DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer UNIQUE,
  fieldname varchar(50) NOT NULL
);

INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field1');
INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field2');


DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer UNIQUE,
    name varchar(25) NOT NULL
)

ALTER TABLE region
ADD CONSTRAINT region_description UNIQUE(regiondescription);

ALTER TABLE shippers
ADD CONSTRAINT shippers_companyname UNIQUE(companyname);


CREATE TABLE IF NOT EXISTS practices (
	practiceid integer NOT NULL
);

INSERT INTO practices (practiceid)
VALUES (null);

DROP TABLE IF EXISTS practices;

CREATE TABLE IF NOT EXISTS practices (
practiceid integer NOT NULL,
practice_field varchar(50) NOT NULL
);

ALTER TABLE products
ALTER COLUMN unitprice SET NOT NULL;

ALTER TABLE employees
ALTER COLUMN lastname SET NOT NULL;

