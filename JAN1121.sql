NORTHWIND
SELECT DISTINCT country FROM suppliers Order by Country ASC;

SELECT DISTINCT country FROM suppliers order by country DESC;


SELECT productname,unitprice FROM 
products order by unitprice DESC,
 productname ASC;
 
 
 SELECT MIN(orderdate)
 from orders where shipcountry='Italy';
 
 SELECT MAX(shippeddate)
 from orders where shipcountry='Canada';
 
 SELECT MAX(shippeddate-orderdate)
 from orders where shipcountry='France';
 
 SELECT AVG(freight)
 from orders where shipcountry='Brazil';
 
 SELECT SUM(quantity)
 from order_details where productid=14;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ADVENTURE
SELECT * from production.product product;

SELECT * from purchasing.vendor vendor;

SELECT name,weight,productnumber from production.product 
order by weight ASC;


SELECT *
FROM purchasing.productvendor
WHERE productid=407
ORDER BY averageleadtime ASC;

SELECT * FROM sales.salesorderdetail
WHERE productid=799
ORDER BY orderqty DESC;


SELECT MAX(discountpct)
FROM sales.specialoffer;

--5
SELECT MIN(sickleavehours)
FROM humanresources.employee;

--6
SELECT MAX(rejectedqty)
FROM purchasing.purchaseorderdetail;

--7
SELECT AVG(rate)
FROM humanresources.employeepayhistory;


SELECT AVG(standardcost)
FROM production.productcosthistory
WHERE productid=738;

SELECT SUM(scrappedqty)
FROM production.workorder
WHERE productid = 529;

SELECT name
FROM purchasing.vendor
WHERE name LIKE 'G%';

SELECT name
FROM purchasing.vendor
WHERE name LIKE '%Bike%';


SELECT firstname
FROM person.person
WHERE firstname LIKE '_t%';


SELECT *
FROM person.emailaddress
LIMIT 20;


SELECT *
FROM production.productcategory
LIMIT 2;


SELECT COUNT(*)
FROM production.product
WHERE weight IS NULL;

SELECT COUNT(*)
FROM person.person
WHERE additionalcontactinfo IS NOT NULL;


 
 SELECT AVG(quantity)
 from order_details where productid=35;
 
 
 SELECT companyname,contactname
 from customers where contactname LIKE 'D%';
 
 SELECT companyname
 from suppliers where companyname LIKE '_or%';
 
 SELECT companyname
 from customers where companyname LIKE '%er';
 
 
 SELECT unitprice*quantity AS TotalSpent
 from order_details; 
 
 SELECT productid,unitprice*quantity AS TotalCost
FROM order_details
ORDER BY TotalCost DESC
LIMIT 5;

SELECT productname,unitprice*unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory ASC
LIMIT 2;

SELECT count(*)
FROM customers
WHERE region IS NULL;

SELECT count(*)
FROM suppliers
WHERE region IS NOT NULL;



 
 
 