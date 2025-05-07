SELECT Spacecraft, [Launch date],
[Carrier rocket], Operator, [Mission type]
INTO SuccessfulMissions
FROM MoonMissions;

GO

UPDATE SuccessfulMissions
SET Operator = TRIM(Operator);

GO

-- STUFF returnerar null om den inte matchar med en start parantes, om null returneras, returneras originalvärdet
-- STUFF argument: sträng, startindex, längd som tas bort, ersättningssträng
UPDATE SuccessfulMissions
SET Spacecraft = 
ISNULL(STUFF(Spacecraft,
PATINDEX('%(%' , Spacecraft), 
PATINDEX('%)%', Spacecraft) - PATINDEX('%(%', Spacecraft) + 1,
''), Spacecraft);

GO

SELECT Operator, COUNT([Mission type]) AS [Mission count]
FROM SuccessfulMissions
GROUP BY Operator
HAVING COUNT([Mission type]) > 1;

GO

SELECT *
INTO NewUsers
FROM Users;
--
ALTER TABLE NewUsers
ADD [Name] NVARCHAR(100),
    Gender NVARCHAR(10);
--
UPDATE NewUsers
SET [Name] = FirstName + ' ' + LastName,
    Gender = CASE 
    WHEN (CONVERT(INT, SUBSTRING(ID, LEN(ID) - 1, 1)) % 2) = 1 THEN 'Male'
    WHEN (CONVERT(INT, SUBSTRING(ID, LEN(ID) - 1, 1)) % 2) = 0 THEN 'Female'
END;

GO

SELECT UserName AS Occurences
FROM NewUsers
GROUP BY UserName
HAVING COUNT(*) > 1;

GO
-- inspirerad kod från Grok, Först skapar jag en temporär tabell med unika nummer för alla dubletter
-- sedan konkatinerar jag numret med respektive användarnamn
ALTER TABLE NewUsers
ALTER COLUMN UserName varchar(100);
WITH Dubletter AS (SELECT ID, ROW_NUMBER() OVER (PARTITION BY UserName ORDER BY UserName) AS IdNum 
FROM NewUsers
WHERE UserName IN (
    SELECT UserName
    FROM NewUsers
    GROUP BY UserName
    HAVING COUNT(*) > 1
))
SELECT * FROM Dubletter;
UPDATE NewUsers
SET UserName = NewUsers.UserName + '_' + CAST(Dubletter.IdNum AS NVARCHAR)
FROM NewUsers
INNER JOIN Dubletter
    ON NewUsers.ID = Dubletter.ID;

GO

DELETE FROM NewUsers
WHERE Gender = 'Female' AND CONVERT(INT, LEFT(ID, 2)) < 70;

GO

INSERT INTO NewUsers
VALUES ('133769-4220', 'sveber', '2194506fc6ef7a2048f03a0f4ee7c641', 'Svea', 'Berg', '420blazeit@gmail.com', '071-3371337', 'Svea Berg', 'Female');

GO
-- Gör en antagelse att alla är födda innan 2000 eftersom inte hela personnumret finns med.(Hur jag utformar AVG argumentet)
-- Olyckligtvis ser det ut som det är fel i koden eftersom båda har samma medelålder men om man tar bort yngre men ser man skillnad
SELECT Gender, AVG((CONVERT(INT, RIGHT(YEAR(GETDATE()), 2)) + 100) - CONVERT(INT, LEFT(ID, 2))) AS 'Average Age'
FROM NewUsers
-- WHERE NOT (Gender = 'Male' AND CONVERT(INT, LEFT(ID, 2)) > 70)
GROUP BY Gender;

GO



BEGIN TRANSACTION;
SELECT @@TRANCOUNT AS TransactionCount;
ROLLBACK TRANSACTION;
COMMIT TRANSACTION;
