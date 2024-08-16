--NOT IN with IS NOT NULL
/*
You want to know which country capitals have 
never been the closest city to recorded earthquakes.
*/

SELECT WorldBankRegion,
       CountryName,
       Capital -- Capital city name column
FROM Nations
WHERE Capital NOT IN
	(SELECT NearestPop -- City name column
     FROM Earthquakes);
----------------------------------------
SELECT WorldBankRegion,
       CountryName,
       Capital
FROM Nations
WHERE Capital NOT IN
	(SELECT NearestPop
     FROM Earthquakes
     Where NearestPop IS NOT NULL); -- filter condition