SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'Transactions' table.
CREATE PROCEDURE [dbo].[_Transactions_DeleteAll]
AS
	DELETE FROM [dbo].[Transactions]
GO
