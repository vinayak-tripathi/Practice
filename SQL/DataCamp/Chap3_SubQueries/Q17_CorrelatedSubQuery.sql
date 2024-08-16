--Correlated sub-query
/*A friend is working on a project looking at earthquake hazards 
around the world. She requires a table that lists all countries, 
their continent and the average magnitude earthquake by country. 
*/

SELECT UNContinentRegion,
       CountryName, 
        (SELECT AVG(magnitude) -- Add average magnitude
        FROM Earthquakes e 
         	  -- Add country code reference
        WHERE n.code2= e.Country) AS AverageMagnitude 
FROM Nations n
ORDER BY UNContinentRegion DESC, 
         AverageMagnitude DESC;