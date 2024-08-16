/* Processing order
The following query returns earthquakes 
with a magnitude higher than 8, 
and at a depth of more than 500km.
*/
SELECT [Date], Country, Place, Depth, Magnitude
FROM Earthquakes
Where Magnitude>8
    AND Depth>500
ORDER BY Depth DESC;