SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'CUSTOMERS' table.
CREATE PROCEDURE [dbo].[_CUSTOMERS_DeleteAll]
AS
	DELETE FROM [dbo].[CUSTOMERS]
GO