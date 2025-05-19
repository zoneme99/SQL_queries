ROLLBACK;
--BEGIN TRANSACTION;
--GO
--SELECT @@TRANCOUNT;
CREATE TABLE [Forfattare] (
  [ID] int PRIMARY KEY,
  [Fornamn] nvarchar(25),
  [Efternamn] nvarchar(25),
  [Fodelsedatum] nvarchar(12)
)
GO

CREATE TABLE [Bocker] (
  [ISBN13] nvarchar(25) PRIMARY KEY,
  [Titel] nvarchar(25),
  [Sprak] nvarchar(10),
  [Genre] nvarchar(15),
  [Pris] float,
  [Utgivningsdatum] nvarchar(12),
  [ForlagID] int
)
GO

CREATE TABLE [Forfattare_Bocker] (
  [ForfattarID] int,
  [ISBN13] nvarchar(25)
)
GO

CREATE TABLE [Forfattare_Forlag] (
  [ISBN13] int,
  [ForfattarID] int,
  [ForlagID] int
)
GO

CREATE TABLE [Butiker] (
  [ID] int PRIMARY KEY,
  [Namn] nvarchar(50),
  [Adress] nvarchar(50)
)
GO

CREATE TABLE [LagerSaldo] (
  [ButiksID] int,
  [ISBN13] nvarchar(25),
  [Saldo] int DEFAULT (0)
)
GO

CREATE TABLE [Kunder] (
  [ID] int PRIMARY KEY,
  [Namn] nvarchar(50),
  [Fodelsedatum] nvarchar(12),
  [Address] nvarchar(50)
)
GO

CREATE TABLE [Ordrar] (
  [ID] int PRIMARY KEY,
  [KundID] int,
  [Skapad] time,
  [Senast_levererad] time
)
GO

CREATE TABLE [OrderDetaljer] (
  [OrderID] int,
  [ISBN13] nvarchar(25),
  [Antal] int
)
GO

CREATE TABLE [Forlag] (
  [ID] int,
  [Namn] nvarchar(50)
)
GO

ALTER TABLE [Forfattare_Forlag] ADD FOREIGN KEY ([ISBN13]) REFERENCES [Bocker] ([ISBN13])
GO

ALTER TABLE [Forfattare_Forlag] ADD FOREIGN KEY ([ForfattarID]) REFERENCES [Forfattare] ([ID])
GO

ALTER TABLE [Forfattare_Forlag] ADD FOREIGN KEY ([ForlagID]) REFERENCES [Forlag] ([ID])
GO

ALTER TABLE [Forfattare_Bocker] ADD FOREIGN KEY ([ForfattarID]) REFERENCES [Forfattare] ([ID])
GO

ALTER TABLE [Forfattare_Bocker] ADD FOREIGN KEY ([ISBN13]) REFERENCES [Bocker] ([ISBN13])
GO

ALTER TABLE [LagerSaldo] ADD FOREIGN KEY ([ISBN13]) REFERENCES [Bocker] ([ISBN13])
GO

ALTER TABLE [LagerSaldo] ADD FOREIGN KEY ([ButiksID]) REFERENCES [Butiker] ([ID])
GO

ALTER TABLE [Ordrar] ADD FOREIGN KEY ([KundID]) REFERENCES [Kunder] ([ID])
GO

ALTER TABLE [OrderDetaljer] ADD FOREIGN KEY ([OrderID]) REFERENCES [Ordrar] ([ID])
GO

ALTER TABLE [OrderDetaljer] ADD FOREIGN KEY ([ISBN13]) REFERENCES [Bocker] ([ISBN13])
GO

ALTER TABLE [Bocker] ADD FOREIGN KEY ([ForlagID]) REFERENCES [Forlag] ([ID])
GO

