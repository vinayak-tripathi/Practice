--Uncorrelated sub-query
/*You want a query that returns the region and countries 
that have experienced earthquakes centered at a depth of 400km or deeper. 
*/

SELECT UNStatisticalRegion,
       CountryName 
FROM Nations
WHERE code2 -- Country code for outer query 
         IN (SELECT Country-- Country code for sub-query
             FROM Earthquakes
             WHERE depth >= 400 ) -- Depth filter
ORDER BY UNStatisticalRegion;