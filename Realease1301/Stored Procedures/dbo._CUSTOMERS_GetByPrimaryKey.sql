SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CUSTOMERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CUSTOMERS_GetByPrimaryKey]
	@CUSTOMERID int
AS
	SELECT * FROM [dbo].[CUSTOMERS] WHERE
		[CUSTOMERID] = @CUSTOMERID
GO
