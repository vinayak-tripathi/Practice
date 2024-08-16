--Interrogating with INTERSECT
/*
The Earthquakes and NBA Season 2017-2018 databases both 
contain information on countries and cities. You are 
interested to know which countries are represented by 
players in the 2017-2018 NBA season and you believe you 
can get the results you require by querying the relevant 
tables across these two databases.
*/

SELECT CountryName 
FROM Nations -- Table from Earthquakes database

INTERSECT -- Operator for the intersect between tables

SELECT Country
FROM Players; -- Table from NBA Season 2017-2018 database


