USE Bokhandel;
BEGIN TRANSACTION;
BEGIN TRY
-- Forlag
INSERT INTO Forlag (ID, Namn) VALUES (1, 'Forlag_1');
INSERT INTO Forlag (ID, Namn) VALUES (2, 'Forlag_2');
INSERT INTO Forlag (ID, Namn) VALUES (3, 'Forlag_3');
INSERT INTO Forlag (ID, Namn) VALUES (4, 'Forlag_4');
INSERT INTO Forlag (ID, Namn) VALUES (5, 'Forlag_5');
INSERT INTO Forlag (ID, Namn) VALUES (6, 'Forlag_6');
INSERT INTO Forlag (ID, Namn) VALUES (7, 'Forlag_7');
INSERT INTO Forlag (ID, Namn) VALUES (8, 'Forlag_8');
INSERT INTO Forlag (ID, Namn) VALUES (9, 'Forlag_9');
INSERT INTO Forlag (ID, Namn) VALUES (10, 'Forlag_10');

-- Forfattare
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (1, 'Fornamn_1', 'Efternamn_1', '1965-07-20');
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (2, 'Fornamn_2', 'Efternamn_2', '1977-06-18');
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (3, 'Fornamn_3', 'Efternamn_3', '1976-08-04');
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (4, 'Fornamn_4', 'Efternamn_4', '1963-03-23');
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (5, 'Fornamn_5', 'Efternamn_5', '1984-06-09');
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (6, 'Fornamn_6', 'Efternamn_6', '1966-07-21');
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (7, 'Fornamn_7', 'Efternamn_7', '1977-04-02');
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (8, 'Fornamn_8', 'Efternamn_8', '1948-07-04');
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (9, 'Fornamn_9', 'Efternamn_9', '1981-07-16');
INSERT INTO Forfattare (ID, Fornamn, Efternamn, Fodelsedatum) VALUES (10, 'Fornamn_10', 'Efternamn_10', '1959-03-05');

-- Bocker
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000000', 'Boktitel_0', 'Svenska', 'Roman', 412.84, '2003-06-06', 5);
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000001', 'Boktitel_1', 'Svenska', 'Roman', 195.93, '2015-08-09', 6);
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000002', 'Boktitel_2', 'Svenska', 'Roman', 294.79, '2003-11-09', 2);
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000003', 'Boktitel_3', 'Svenska', 'Roman', 497.81, '2010-08-15', 9);
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000004', 'Boktitel_4', 'Svenska', 'Roman', 129.48, '2014-05-08', 1);
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000005', 'Boktitel_5', 'Svenska', 'Roman', 396.12, '2016-12-26', 7);
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000006', 'Boktitel_6', 'Svenska', 'Roman', 354.73, '2012-03-04', 3);
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000007', 'Boktitel_7', 'Svenska', 'Roman', 287.87, '2005-12-16', 5);
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000008', 'Boktitel_8', 'Svenska', 'Roman', 376.62, '2015-02-09', 8);
INSERT INTO Bocker (ISBN13, Titel, Sprak, Genre, Pris, Utgivningsdatum, ForlagID) VALUES ('9780000000009', 'Boktitel_9', 'Svenska', 'Roman', 271.96, '2009-03-18', 7);

-- Forfattare_Bocker
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (2, '9780000000000');
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (4, '9780000000001');
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (6, '9780000000002');
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (5, '9780000000003');
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (6, '9780000000004');
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (6, '9780000000005');
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (1, '9780000000006');
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (7, '9780000000007');
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (6, '9780000000008');
INSERT INTO Forfattare_Bocker (ForfattarID, ISBN13) VALUES (1, '9780000000009');

-- Forfattare_Forlag
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000000', 2, 5);
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000001', 2, 6);
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000002', 7, 2);
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000003', 5, 9);
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000004', 2, 1);
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000005', 6, 7);
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000006', 3, 3);
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000007', 6, 5);
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000008', 7, 8);
INSERT INTO Forfattare_Forlag (ISBN13, ForfattarID, ForlagID) VALUES ('9780000000009', 1, 7);

-- Butiker
INSERT INTO Butiker (ID, Namn, Adress) VALUES (1, 'Butik_1', 'Gata_1 10');
INSERT INTO Butiker (ID, Namn, Adress) VALUES (2, 'Butik_2', 'Gata_2 10');
INSERT INTO Butiker (ID, Namn, Adress) VALUES (3, 'Butik_3', 'Gata_3 10');
INSERT INTO Butiker (ID, Namn, Adress) VALUES (4, 'Butik_4', 'Gata_4 10');
INSERT INTO Butiker (ID, Namn, Adress) VALUES (5, 'Butik_5', 'Gata_5 10');
INSERT INTO Butiker (ID, Namn, Adress) VALUES (6, 'Butik_6', 'Gata_6 10');
INSERT INTO Butiker (ID, Namn, Adress) VALUES (7, 'Butik_7', 'Gata_7 10');
INSERT INTO Butiker (ID, Namn, Adress) VALUES (8, 'Butik_8', 'Gata_8 10');
INSERT INTO Butiker (ID, Namn, Adress) VALUES (9, 'Butik_9', 'Gata_9 10');
INSERT INTO Butiker (ID, Namn, Adress) VALUES (10, 'Butik_10', 'Gata_10 10');

-- LagerSaldo
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (10, '9780000000000', 20);
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (5, '9780000000001', 5);
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (10, '9780000000002', 9);
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (7, '9780000000003', 3);
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (3, '9780000000004', 15);
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (6, '9780000000005', 10);
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (9, '9780000000006', 12);
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (2, '9780000000007', 2);
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (4, '9780000000008', 14);
INSERT INTO LagerSaldo (ButiksID, ISBN13, Saldo) VALUES (4, '9780000000009', 12);

-- Kunder
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (1, 'Kund_1', '1960-10-21', 'Väg_1 5');
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (2, 'Kund_2', '1971-08-13', 'Väg_2 5');
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (3, 'Kund_3', '1966-08-04', 'Väg_3 5');
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (4, 'Kund_4', '1973-11-12', 'Väg_4 5');
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (5, 'Kund_5', '1974-09-22', 'Väg_5 5');
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (6, 'Kund_6', '1992-06-05', 'Väg_6 5');
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (7, 'Kund_7', '1984-06-04', 'Väg_7 5');
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (8, 'Kund_8', '1971-08-21', 'Väg_8 5');
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (9, 'Kund_9', '1992-07-10', 'Väg_9 5');
INSERT INTO Kunder (ID, Namn, Fodelsedatum, Address) VALUES (10, 'Kund_10', '1997-12-16', 'Väg_10 5');

-- Ordrar
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (1, 4, '2025-04-05 11:55:13', '2025-05-06 11:55:13');
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (2, 1, '2025-03-15 11:55:13', '2025-04-02 11:55:13');
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (3, 8, '2025-04-14 11:55:13', '2025-04-27 11:55:13');
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (4, 7, '2025-03-17 11:55:13', '2025-05-01 11:55:13');
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (5, 4, '2025-02-10 11:55:13', '2025-04-04 11:55:13');
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (6, 4, '2025-05-13 11:55:13', '2025-04-25 11:55:13');
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (7, 3, '2025-03-20 11:55:13', '2025-04-21 11:55:13');
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (8, 10, '2025-04-02 11:55:13', '2025-04-30 11:55:13');
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (9, 10, '2025-02-22 11:55:13', '2025-04-09 11:55:13');
INSERT INTO Ordrar (ID, KundID, Skapad, Senast_levererad) VALUES (10, 7, '2025-03-14 11:55:13', '2025-05-08 11:55:13');

-- OrderDetaljer
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (1, '9780000000007', 1);
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (2, '9780000000002', 2);
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (3, '9780000000006', 1);
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (4, '9780000000004', 1);
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (5, '9780000000001', 1);
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (6, '9780000000009', 2);
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (7, '9780000000004', 1);
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (8, '9780000000005', 1);
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (9, '9780000000003', 2);
INSERT INTO OrderDetaljer (OrderID, ISBN13, Antal) VALUES (10, '9780000000005', 2);

COMMIT TRANSACTION;

END TRY

BEGIN CATCH
    -- Roll back the transaction if an error occurs
    ROLLBACK TRANSACTION;

    -- Return the error details
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage,
        ERROR_LINE() AS ErrorLine,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_STATE() AS ErrorState;
END CATCH;