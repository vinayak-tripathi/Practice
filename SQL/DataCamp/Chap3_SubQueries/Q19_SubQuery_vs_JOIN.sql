--Sub-query vs INNER JOIN
/*You want to find out the 2017 population of 
the biggest city for every country in the world.
*/

---Using Correlated SubQuery
SELECT
	n.CountryName,
	 (SELECT Max(c.Pop2017) -- Add 2017 population column
	 FROM Cities AS c 
                       -- Outer query country code column
	 WHERE c.CountryCode = n.code2) AS BiggestCity
FROM nations AS n; -- Outer query table

----------------------
---Using Inner Join
SELECT n.CountryName, 
       c.BiggestCity 
FROM Nations AS n
INNER JOIN -- Join the Nations table and sub-query
    (SELECT CountryCode, 
     MAX(Pop2017) AS BiggestCity 
     FROM Cities
     GROUP BY CountryCode) AS c
ON n.Code2 = c.CountryCode; -- Add the joining columns