--SAMPLE
Select firstname, lastname
FROM saleslt.employees
UNION
Select firstname, lastname
FROM saleslt.customers
ORDER BY lastname;