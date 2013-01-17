SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'Transactions' table using the primary key value.
CREATE PROCEDURE [dbo].[_Transactions_GetByPrimaryKey]
	@TxID int
AS
	SELECT * FROM [dbo].[Transactions] WHERE
		[TxID] = @TxID
GO
