--SELECT what you need
/* Your friend is a seismologist, and she is doing a study on
 earthquakes in South East Asia. She asks you for a query 
that returns coordinate locations, strength, depth and nearest 
city of all earthquakes in Papua New Guinea and Indonesia.
*/

SELECT latitude, -- Y location coordinate column
       longitude, -- X location coordinate column
	   magnitude , -- Earthquake strength column
	   depth, -- Earthquake depth column
		NearestPop-- Nearest city column
FROM Earthquakes
WHERE Country = 'PG' -- Papua New Guinea country code
	OR Country = 'ID'; -- Indonesia country code
