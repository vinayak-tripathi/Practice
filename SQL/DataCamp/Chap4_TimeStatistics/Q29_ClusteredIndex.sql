--Clustered index
/*
Query 1

Returns all rows where the country is either Russia or China.
Query 2

Returns all rows where the country is either Jamaica or New Zealand.
*/
-- Query 1
SELECT *
FROM Cities
WHERE CountryCode = 'RU' -- Country code
		OR CountryCode = 'CN' -- Country code

-- Query 2
SELECT *
FROM Cities
WHERE CountryCode IN ('JM','NZ') -- Country codes
