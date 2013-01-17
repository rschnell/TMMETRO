SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'Transactions' table.
CREATE PROCEDURE [dbo].[_Transactions_Update]
	-- The rest of writeable parameters
	@TMSubscriptionID int,
	@TMUserID int,
	@TxType int,
	@CountCases int,
	@CountSpace int,
	@CountSubscriptions int,
	@TxRecieptNumber varchar(50),
	@TxCleared bit,
	@TimeStamp datetime,
	-- Primary key parameters
	@TxID int
AS
	UPDATE [dbo].[Transactions] SET
		[TMSubscriptionID] = @TMSubscriptionID,
		[TMUserID] = @TMUserID,
		[TxType] = @TxType,
		[countCases] = @CountCases,
		[countSpace] = @CountSpace,
		[countSubscriptions] = @CountSubscriptions,
		[TxRecieptNumber] = @TxRecieptNumber,
		[TxCleared] = @TxCleared,
		[TimeStamp] = @TimeStamp
	WHERE
		[TxID] = @TxID
GO
