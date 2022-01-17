SELECT companyname, orderid
FROM orders
FULL JOIN customers ON customers.customerid=orders.customerid;

SELECT productname, categoryname
FROM categories
FULL JOIN products ON products.categoryid=categories.categoryid;
