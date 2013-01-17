SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CUSTOMERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CUSTOMERS_DeleteByPrimaryKey]
	@CUSTOMERID int
AS
	DELETE FROM [dbo].[CUSTOMERS] WHERE
		[CUSTOMERID] = @CUSTOMERID
GO
