--Remove duplicates with DISTINCT()
/*You want to know the closest city to earthquakes 
with a magnitude of 8 or higher. You can get this information 
from the Earthquakes table. However, a simple query returns 
duplicate rows because some cities have experienced more than one 
magnitude 8 or higher earthquake.
*/

SELECT NearestPop, -- Add the closest city
		Country 
FROM Earthquakes
WHERE Magnitude >= 8
	AND NearestPop IS NOT NULL
ORDER BY NearestPop;
----------------
/*
You can remove duplicates by using the DISTINCT() clause. 
Once you have your results, you would like to know how many 
times each city has experienced an earthquake of magnitude 8 
or higher.*/


SELECT DISTINCT(NearestPop),-- Remove duplicate city
		Country
FROM Earthquakes
WHERE magnitude>=8 -- Add filter condition 
	AND NearestPop IS NOT NULL
ORDER BY NearestPop;


--------------------------
SELECT NearestPop, 
       Country, 
       Count(NearestPop) NumEarthquakes -- Number of cities
FROM Earthquakes
WHERE Magnitude >= 8
	AND Country IS NOT NULL
Group By NearestPop,Country -- Group columns
ORDER BY NumEarthquakes DESC;