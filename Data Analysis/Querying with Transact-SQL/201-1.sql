--SELECT 'Hello World'

--SELECT ProductID, Name, ListPrice, StandardCost, ListPrice - StandardCost AS Margin
--FROM SalesLT.Product;

--SELECT ProductID, Name, Color, Size, Color + Size AS Style, ListPrice + Size
--FROM SalesLT.Product;

--CAST
SELECT CAST(ProductID AS varchar(5)) + ': ' + Name AS ProductName
FROM SalesLT.Product
--CONVERT
SELECT CONVERT(varchar(5), ProductID) + ': ' + Name AS ProductName
FROM SalesLT.Product

--CONVERT DATES
SELECT SellStartDate,
	CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,
	Convert(nvarchar(30), SellStartDate, 126) as ISO8601FormatDate
From SalesLt.Product
--Try to Cast
SELECT Name, Try_cast(Size as Integer) As NumbericSize
From SalesLT.Product


--Lab ¨C Introduction to Transact-SQL
--Challenge 1: Retrieve Customer Data
--1. Retrieve customer details
SELECT * FROM SalesLT.Customer 
--2. Retrieve customer name data
SELECT Title, FirstName, MiddleName, LastName, Suffix 
FROM SalesLT.Customer 
 -- 3. Retrieve customer names and phone numbers
SELECT SalesPerson, Title + LastName AS CustomerName, Phone AS CustomerPhone 
FROM SalesLT.Customer

--Challenge 2: Retrieve Customer and Sales Data
--1. Retrieve a list of customer companies
SELECT Cast(CustomerID AS varchar(5)) + ':' + CompanyName AS CustomerCompanies 
FROM SalesLT.Customer

--2. Retrieve a list of sales order revisions
SELECT * FROM SalesLT.SalesOrderHeader

SELECT 'SO' + Cast(SalesOrderID as varchar(5)) + '(' + Convert(varchar(1), RevisionNumber) + ')' as SalesOrderNumber
FROM SalesLT.SalesOrderHeader

SELECT SalesOrderNumber + ' (' + STR(RevisionNumber, 1) + ')' AS OrderRevision,
	   CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;

SELECT Convert(nvarchar(10), OrderDate, 102) As Orderdate
FROM SalesLT.SalesOrderHeader

--Challenge 3: Retrieve Customer Contact Details
--1. Retrieve customer contact names with middle names if known
SELECT FirstName + ' ' + Isnull(MiddleName, '') + ' ' + Lastname as Name
FROM SalesLT.Customer 

--2. Retrieve primary contact details
UPDATE SalesLT.Customer SET EmailAddress = NULL WHERE CustomerID % 7 = 1;

SELECT CustomerID, isnull(EmailAddress, Phone) As PrimaryContact
From SalesLT.Customer

--======>
SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

--3. Retrieve shipping status
UPDATE SalesLT.SalesOrderHeader SET ShipDate = NULL WHERE SalesOrderID > 71899;

SELECT SalesOrderID, OrderDate, 
	case 
		when ShipDate is null then 'Awaiting Shipment'
		else 'Shipped' 
	end as ShippingStatus
FROM SalesLT.SalesOrderHeader