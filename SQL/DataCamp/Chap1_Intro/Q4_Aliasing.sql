--Aliasing 
/*Ambiguous column names
The following query joins the 
Players and PlayerStats tables to 
return total points by 
PlayerName and Country 
for all players from Australia.
*/
SELECT p.PlayerName, p.Country,
    SUM(ps.TotalPoints) as TotalPoints
FROM PlayerStats ps 
INNER JOIN Players p
    ON ps.PlayerName = p.PlayerName
Where p.Country = 'Australia'
GROUP BY p.PlayerName,p.Country;