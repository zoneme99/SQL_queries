--ROLLBACK;
BEGIN TRANSACTION;
--SELECT @@TRANCOUNT;
BEGIN TRY
CREATE TABLE [Forfattare] (
  [ID] int PRIMARY KEY,
  [Fornamn] nvarchar(25),
  [Efternamn] nvarchar(25),
  [Fodelsedatum] nvarchar(12)
);

CREATE TABLE [Bocker] (
  [ISBN13] nvarchar(25) PRIMARY KEY,
  [Titel] nvarchar(25),
  [Sprak] nvarchar(10),
  [Genre] nvarchar(15),
  [Pris] float,
  [Utgivningsdatum] nvarchar(12),
  [ForlagID] int
)
;

CREATE TABLE [Forfattare_Bocker] (
  [ForfattarID] int,
  [ISBN13] nvarchar(25)
)
;

CREATE TABLE [Forfattare_Forlag] (
  [ISBN13] nvarchar(25),
  [ForfattarID] int,
  [ForlagID] int
)
;

CREATE TABLE [Butiker] (
  [ID] int PRIMARY KEY,
  [Namn] nvarchar(50),
  [Adress] nvarchar(50)
)
;

CREATE TABLE [LagerSaldo] (
  [ButiksID] int,
  [ISBN13] nvarchar(25),
  [Saldo] int DEFAULT (0)
)
;

CREATE TABLE [Kunder] (
  [ID] int PRIMARY KEY,
  [Namn] nvarchar(50),
  [Fodelsedatum] nvarchar(12),
  [Address] nvarchar(50)
)
;

CREATE TABLE [Ordrar] (
  [ID] int PRIMARY KEY,
  [KundID] int,
  [Skapad] time,
  [Senast_levererad] time
)
;

CREATE TABLE [OrderDetaljer] (
  [OrderID] int,
  [ISBN13] nvarchar(25),
  [Antal] int
)
;

CREATE TABLE [Forlag] (
  [ID] int PRIMARY KEY,
  [Namn] nvarchar(50)
)
;

ALTER TABLE [Forfattare_Forlag] ADD FOREIGN KEY ([ISBN13]) REFERENCES [Bocker] ([ISBN13])
;

ALTER TABLE [Forfattare_Forlag] ADD FOREIGN KEY ([ForfattarID]) REFERENCES [Forfattare] ([ID])
;

ALTER TABLE [Forfattare_Forlag] ADD FOREIGN KEY ([ForlagID]) REFERENCES [Forlag] ([ID])
;

ALTER TABLE [Forfattare_Bocker] ADD FOREIGN KEY ([ForfattarID]) REFERENCES [Forfattare] ([ID])
;

ALTER TABLE [Forfattare_Bocker] ADD FOREIGN KEY ([ISBN13]) REFERENCES [Bocker] ([ISBN13])
;

ALTER TABLE [LagerSaldo] ADD FOREIGN KEY ([ISBN13]) REFERENCES [Bocker] ([ISBN13])
;

ALTER TABLE [LagerSaldo] ADD FOREIGN KEY ([ButiksID]) REFERENCES [Butiker] ([ID])
;

ALTER TABLE [Ordrar] ADD FOREIGN KEY ([KundID]) REFERENCES [Kunder] ([ID])
;

ALTER TABLE [OrderDetaljer] ADD FOREIGN KEY ([OrderID]) REFERENCES [Ordrar] ([ID])
;

ALTER TABLE [OrderDetaljer] ADD FOREIGN KEY ([ISBN13]) REFERENCES [Bocker] ([ISBN13])
;

ALTER TABLE [Bocker] ADD FOREIGN KEY ([ForlagID]) REFERENCES [Forlag] ([ID])
;
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
