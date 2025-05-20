USE Bokhandel;
SELECT MAX(Forfattare.Fornamn + ' ' + Forfattare.Efternamn) AS Namn,
MAX(DATEDIFF(YEAR, CONVERT(datetime, Forfattare.Fodelsedatum), GETDATE())) AS Ålder,
CAST(COUNT(Bocker.Titel) AS varchar) + ' st' AS Titlar,
CAST(FORMAT(SUM(LagerSaldo.Saldo * Bocker.Pris), 'N1') AS varchar) + ' kr' AS Lagervärde 
FROM Forfattare_Forlag

INNER JOIN Forfattare ON Forfattare.ID = Forfattare_Forlag.ForfattarID
INNER JOIN Bocker ON Bocker.ISBN13 = Forfattare_Forlag.ISBN13
INNER JOIN LagerSaldo ON LagerSaldo.ISBN13 = Forfattare_Forlag.ISBN13
GROUP BY ForfattarID;