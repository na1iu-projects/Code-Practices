--practices

select saleslt.product.name, saleslt.productcategory.name
from saleslt.product
join saleslt.productcategory
on saleslt.product.productcategoryid = saleslt.productcategory.productcategoryid;

-- Table aliases
select p.name, pc.name
from saleslt.product as p
join saleslt.productcategory as pc
on p.productcategoryid = pc.productcategoryid;

-- joining more than 2 tables
select oh.orderdate, oh.salesordernumber, p.name, od.orderqty, od.unitprice 
from saleslt.salesorderheader as oh
join saleslt.salesorderdetail as od
on oh.salesorderid = od.salesorderid
join saleslt.product as p
on od.productid = p.productid
order by oh.orderdate, oh.salesorderid, od.salesorderdetailid

--Multiple join predicates
select *
from saleslt.salesorderheader as oh
join saleslt.salesorderdetail as od
on od.salesorderid = oh.salesorderid
join saleslt.product as p
on od.productid = p.productid and od.unitprice < p.listprice
order by oh.orderdate, oh.salesorderid, od.salesorderdetailid;

-- Get all customers, with sales orders for those who've bought anything
select c.firstname, c.lastname, oh.salesordernumber
from saleslt.customer as c
left join saleslt.salesorderheader as oh
on c.customerid = oh.customerid where oh.salesordernumber is not null
order by c.customerid

-- More than 2 tables
select p.name, oh.salesordernumber
from saleslt.product as p
left join saleslt.salesorderdetail as od
on p.productid = od.productid 
left join saleslt.salesorderheader as oh
on od.salesorderid = oh.salesorderid
order by p.productid

--Assignment Lab03
--Challenge 1: Generate Invoice Reports
--1. Retrieve customer orders
select c.companyname
from saleslt.customer as c
join saleslt.salesorderheader as oh
on c.customerid = oh.customerid

--2. Retrieve customer orders with addresses
select c.firstname, c.lastname, a.addressline1, a.addressline2, a.city, a.stateprovince, a.countryregion 
from saleslt.customer as c
join saleslt.salesorderheader as oh
on c.customerid = oh.customerid
join saleslt.customeraddress as ca
on c.customerid = ca.customerid and addresstype = 'Main Office'
join saleslt.address as a
on ca.addressid = a.addressid

select c.firstname, c.lastname, a.addressline1, a.addressline2, a.city, a.stateprovince, a.countryregion 
from saleslt.customer as c
join saleslt.salesorderheader as oh
on c.customerid = oh.customerid
join saleslt.customeraddress as ca
on c.customerid = ca.customerid
left join saleslt.address as a
on ca.addressid = a.addressid
where ca.addresstype = 'Main Office'

--Challenge 2: Retrieve Sales Data
--1. Retrieve a list of all customers and their orders
select c.firstname, c.lastname, oh.salesorderid, oh.totaldue
from saleslt.customer as c
left join saleslt.salesorderheader as oh
on c.customerid = oh.customerid
order by oh.salesorderid desc

--2. Retrieve a list of customers with no address
select c.customerid, c.firstname, c.lastname, c.companyname, c.phone
from saleslt.customeraddress as ca
join saleslt.customer as c
on c.customerid = ca.customerid
--left join saleslt.address as a
--on ca.addressid = a.addressid
where a.addressline2 is null;

--3. Retrieve a list of customers and products without orders
select a.addressline1, a.addressline2, a.city, a.stateprovince, a.countryregion 
from saleslt.customer as c
join saleslt.customeraddress as ca
on c.customerid = ca.customerid
left join saleslt.address as a
on ca.addressid = ca.addressid


select *
from saleslt.salesorderdetail