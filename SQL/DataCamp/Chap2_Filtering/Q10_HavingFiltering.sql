--Row filtering with HAVING--

---***Inefficient***---
SELECT Country, COUNT(*) CountOfPlayers 
FROM Players
GROUP BY Country
HAVING Country 
    IN ('Argentina','Brazil','Dominican Republic'
        ,'Puerto Rico');


---***Corrected***---
SELECT Country, COUNT(*) CountOfPlayers 
FROM Players
WHERE Country 
    IN ('Argentina','Brazil','Dominican Republic'
        ,'Puerto Rico')
GROUP BY Country;