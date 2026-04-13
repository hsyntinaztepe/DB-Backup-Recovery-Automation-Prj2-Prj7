USE AdventureWorks2022;
SELECT AddressID, AddressLine1 
FROM Person.Address 
WHERE AddressID BETWEEN 1 AND 10;