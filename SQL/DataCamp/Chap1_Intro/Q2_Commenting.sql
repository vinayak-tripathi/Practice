/*
Commenting - player BMI
*/

SELECT PlayerName, Country,
    ROUND(Weight_kg/SQUARE(Height_cm/100),2) BMI 
FROM Players 
WHERE Country = 'USA'
    OR Country = 'Canada';
/*ORDER BY BMI; --Order BY nor Required*/