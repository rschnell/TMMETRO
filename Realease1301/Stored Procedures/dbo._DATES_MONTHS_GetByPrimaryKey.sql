SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'DATES_MONTHS' table using the primary key value.
CREATE PROCEDURE [dbo].[_DATES_MONTHS_GetByPrimaryKey]
	@M int
AS
	SELECT * FROM [dbo].[DATES_MONTHS] WHERE
		[m] = @M
GO
