--Functions in WHERE
/*You want to know which players
from the 2017-2018 NBA season went to
college in Louisiana. You ask a friend to make 
the query for you. It looks like he overcomplicated 
the WHERE filter condition by unnecessarily applying 
string functions and, also, it does not give you precisely 
what you want because he forgot how to spell Louisiana. 
You will simplify his query to return exactly what you require.
*/


SELECT PlayerName, 
      Country,
      College, 
      DraftYear, 
      DraftNumber 
FROM Players 
-- WHERE UPPER(LEFT(College,5)) LIKE 'LOU%';
WHERE College LIKE 'LOUISIANA%';-- Add the new wildcard filter