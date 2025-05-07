-- a)
SELECT CONCAT('S', FORMAT(Season, '00'), 'E', FORMAT(Episode, '00')) AS EpisodeFormat
FROM GameOfThrones;
-- b)
SELECT * INTO ModUsers
FROM Users;
--DROP TABLE ModUsers
UPDATE ModUsers
SET UserName = CONCAT(LEFT(FirstName, 2), LEFT(LastName, 2));
SELECT * FROM ModUsers;
-- c)
SELECT * INTO Modairports
FROM Airports;
UPDATE Modairports
SET 
    [Time] = ISNULL([Time], '-'),
    DST = ISNULL(DST, '-');
-- d)