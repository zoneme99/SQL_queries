
USE Bokhandel;
SELECT Bocker.Titel, Butiker.Namn AS Butik, LagerSaldo.Saldo
FROM LagerSaldo
INNER JOIN Bocker ON Bocker.ISBN13 = LagerSaldo.ISBN13
INNER JOIN Butiker ON Butiker.ID = LagerSaldo.ButiksID
WHERE Bocker.Titel LIKE '%0%';
