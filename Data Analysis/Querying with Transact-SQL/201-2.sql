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