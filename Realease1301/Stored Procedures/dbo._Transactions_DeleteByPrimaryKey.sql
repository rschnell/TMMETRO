SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'Transactions' table using the primary key value.
CREATE PROCEDURE [dbo].[_Transactions_DeleteByPrimaryKey]
	@TxID int
AS
	DELETE FROM [dbo].[Transactions] WHERE
		[TxID] = @TxID
GO
