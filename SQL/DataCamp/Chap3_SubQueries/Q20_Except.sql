--EXCEPT
/*You want to know which countries have no recorded earthquakes. 
*/

SELECT Code2 -- Add the country code column
FROM Nations

Except -- Add the operator to compare the two queries

SELECT Country 
FROM Earthquakes; -- Table with country codes