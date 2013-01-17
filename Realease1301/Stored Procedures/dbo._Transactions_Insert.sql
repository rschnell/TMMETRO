SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'Transactions' table.
CREATE PROCEDURE [dbo].[_Transactions_Insert]
	@TMSubscriptionID int,
	@TMUserID int,
	@TxType int,
	@CountCases int,
	@CountSpace int,
	@CountSubscriptions int,
	@TxRecieptNumber varchar(50),
	@TxCleared bit,
	@TimeStamp datetime
AS
	INSERT INTO [dbo].[Transactions]
	(
		[TMSubscriptionID],
		[TMUserID],
		[TxType],
		[countCases],
		[countSpace],
		[countSubscriptions],
		[TxRecieptNumber],
		[TxCleared],
		[TimeStamp]
	)
	VALUES
	(
		@TMSubscriptionID,
		@TMUserID,
		@TxType,
		@CountCases,
		@CountSpace,
		@CountSubscriptions,
		@TxRecieptNumber,
		@TxCleared,
		@TimeStamp
	)
	SELECT @@IDENTITY
GO
