--Limit the rows with TOP
/*
Your seismologist friend that is doing a study on earthquakes in 
South East Asia has asked you to subset a query that you provided her. 
She wants two additional queries for earthquakes recorded in Indonesia 
and Papua New Guinea. The first returning the ten shallowest 
earthquakes and the second the upper quartile of the strongest earthquakes.
*/

SELECT TOP 10 -- Limit the number of rows to ten
      Latitude,
      Longitude,
	  Magnitude,
	  Depth,
	  NearestPop
FROM Earthquakes
WHERE Country = 'PG'
	OR Country = 'ID'
ORDER by Depth ASC; -- Order results from shallowest to deepest
