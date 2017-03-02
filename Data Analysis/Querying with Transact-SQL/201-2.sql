--Display a list of product colors
SELECT Distinct isnull(color, 'None') as Color FROM SalesLT.Product ORDER BY Color;

--Display a list of product colors with the word 'None' if the value is null and a dash if the size is null sorted by color
SELECT Distinct isnull(color, 'None') as Color, isnull(size, '-') as Size FROM SalesLT.Product ORDER BY Color;

--Display the top 100 product by list price
SELECT top 100 Name, listprice from saleslt.product order by listprice desc;

--Display the first ten products by produc number
select name, listprice from saleslt.product order by productnumber offset 0 rows fetch next 10 rows only;

--Display the next ten products by product number
select name, listprice from saleslt.product order by productnumber offset 10 rows fetch first 10 rows only;

--Filtering and Using Predicates
select * from saleslt.product
--List information about product model 6
select name, color, size from saleslt.product where productmodelid = 6;

--List information about products that have a product number beginning FR
select productnumber, name, color, size from saleslt.product where productnumber like 'FR%';

--Filter the previous query to ensure that the product number contains two sets of two didgets
select productnumber, name, color, size from saleslt.product where productnumber like 'FR-_[0-9][0-9]_-[0-9][0-9]';

--Find products that have no sell end date
select name, color, size, sellenddate from saleslt.product where sellenddate is not null;

--Find products that have a sell end date in 2006
select name, color, size, sellenddate from saleslt.product where sellenddate between '2006/1/1' and '2006/12/31';