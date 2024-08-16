--UNION and UNION ALL
/*You want a query that returns all cities listed in the Earthquakes database. 
*/
SELECT CityName AS NearCityName, -- City name column
	   CountryCode
FROM Cities

Union -- Append queries

SELECT capital AS NearCityName, -- Nation capital column
       Code2 AS CountryCode
FROM Nations;

---------------------
SELECT CityName AS NearCityName,
	   CountryCode
FROM Cities

UNION ALL -- Append queries

SELECT Capital AS NearCityName,
       code2 AS CountryCode  -- Country code column
FROM Nations;

----------------------
