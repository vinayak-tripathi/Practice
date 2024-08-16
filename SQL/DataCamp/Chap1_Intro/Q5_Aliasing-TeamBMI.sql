/*Aliasing - team BMI
A basketball statistician would like to know 
the average Body Mass Index (BMI) per NBA team, 
in particular, any team with an 
average BMI of 25 or more.*/

--Original Query
/*SELECT Team, 
   ROUND(AVG(BMI),2) AS ___ -- Alias the new column
FROM PlayerStats ___ ___ -- Alias PlayerStats table
INNER JOIN
		(SELECT PlayerName, Country,
			Weight_kg/SQUARE(Height_cm/100) BMI
		 FROM Players) ___ ___ -- Alias the sub-query
             -- Alias the joining columns
	ON ___.PlayerName = ___.PlayerName 
GROUP BY Team
HAVING AVG(BMI) >= 25;
*/

SELECT ps.Team,ROUND(AVG(p.BMI),2) AvgTeamBMI FROM
PlayerStats ps
inner join (
	SELECT PlayerName, 
		Weight_kg/SQUARE(Height_cm/100) BMI
	FROM Players) p
ON ps.PlayerName=p.PlayerName
GROUP BY ps.Team 
Having AVG(p.BMI)>=25;