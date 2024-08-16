--Exclusive LEFT OUTER JOIN

/*
An inclusive LEFT OUTER JOIN returns all the rows in the left query, whereas an exclusive LEFT OUTER JOIN returns only rows in the left query that are absent in the right query.
An exclusive LEFT OUTER JOIN checks for data in one table that is absent in a related table. It does this by using IS NULL in a WHERE filter condition of the right query to restrict it to rows that do not match in the left query.
*/

/*Your sales manager is concerned that orders from French customers 
are declining. He wants you to compile a list of French customers that 
have not placed any orders so he can contact them.
*/

-- First attempt
SELECT c.CustomerID,
       c.CompanyName,
	   c.ContactName,
	   c.ContactTitle,
	   c.Phone 
FROM Customers c
LEFT OUTER JOIN Orders o -- Joining operator
	ON c.CustomerID = o.CustomerID -- Joining columns
WHERE c.Country = 'France';

---------------------------------------------------
-- Second attempt
SELECT c.CustomerID,
       c.CompanyName,
	   c.ContactName,
	   c.ContactTitle,
	   c.Phone 
FROM Customers c
LEFT OUTER JOIN Orders o
	ON c.CustomerID = o.CustomerID
WHERE c.Country = 'France'
	AND o.CustomerID is NULL; -- Filter condition