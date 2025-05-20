USE Bokhandel;
SELECT MAX(ID) AS OrderID,
CAST(DATEDIFF(MINUTE, MAX(Ordrar.Skapad), MAX(Ordrar.Senast_levererad)) AS varchar) + ' min' AS [Total Time Limit],
CAST(DATEDIFF(MINUTE, GETDATE(), MAX(Ordrar.Senast_levererad)) AS varchar) + ' min' AS ETA,
CAST(SUM(OrderDetaljer.Antal) AS varchar) + ' Bocker' AS Volym
FROM Ordrar
INNER JOIN OrderDetaljer ON Ordrar.ID = OrderDetaljer.OrderID
GROUP BY ID
ORDER BY DATEDIFF(MINUTE, GETDATE(), MAX(Ordrar.Senast_levererad)); -- ETA men i numerisk form, ej sträng

