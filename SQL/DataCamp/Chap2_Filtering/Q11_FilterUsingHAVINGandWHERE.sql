--Filtering with WHERE and HAVING
/*You want a query that returns the total 
points contribution of a teams Power Forwards 
where their total points contribution is 
greater than 3000.
*/

SELECT Team, 
	SUM(TotalPoints) AS TotalPFPoints
FROM PlayerStats
-- Filter for only rows with power forwards
Where Position like 'PF'
GROUP BY Team
-- Filter for total points greater than 3000
HAVING SUM(TotalPoints) > 3000;