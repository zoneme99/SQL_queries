CREATE PROCEDURE book_transaction
@SenderID INT,
@ReceiverID INT,
@bookID NVARCHAR(25),
@Quantity INT = 1
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        UPDATE LagerSaldo
        SET Saldo = Saldo - @Quantity
        WHERE @SenderID = ButiksID AND @bookID = ISBN13;

        UPDATE LagerSaldo
        SET Saldo = Saldo + @Quantity
        WHERE @ReceiverID = ButiksID AND @bookID = ISBN13;
        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
    ROLLBACK TRANSACTION;
    SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;