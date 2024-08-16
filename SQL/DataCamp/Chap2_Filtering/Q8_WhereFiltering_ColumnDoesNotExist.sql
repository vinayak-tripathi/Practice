-- First query
/* Column does not exist */

SELECT PlayerName, 
    Team, 
    Position,
    (DRebound+ORebound)/CAST(GamesPlayed AS numeric) AS AvgRebounds
FROM PlayerStats
WHERE (DRebound+ORebound)/GamesPlayed >= 12;

-----------------------------------------------------------
-- Second query

-- Add the new column to the select statement
SELECT tr.PlayerName, 
       tr.Team, 
       tr.Position, 
       tr.AvgRebounds -- Add the new column
FROM
     -- Sub-query starts here                             
	(SELECT 
      PlayerName, 
      Team, 
      Position,
      -- Calculate average total rebounds
     (DRebound+ORebound)/CAST(GamesPlayed AS numeric) AS AvgRebounds
	 FROM PlayerStats) tr
where tr.AvgRebounds>= 12; -- Filter rows
