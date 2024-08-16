--Intersect
/*You want to know which, if any, country capitals are 
listed as the nearest city to recorded earthquakes.
*/

SELECT Capital
FROM  Nations-- Table with capital cities

InterSect -- Add the operator to compare the two queries

SELECT NearestPop -- Add the city name column
FROM Earthquakes;