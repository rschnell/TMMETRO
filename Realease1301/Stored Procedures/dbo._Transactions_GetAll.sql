SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets all records from the 'Transactions' table.
CREATE PROCEDURE [dbo].[_Transactions_GetAll]
AS
	SELECT * FROM [dbo].[Transactions]
GO
