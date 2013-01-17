SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'DATES_MONTHS' table using the primary key value.
CREATE PROCEDURE [dbo].[_DATES_MONTHS_DeleteByPrimaryKey]
	@M int
AS
	DELETE FROM [dbo].[DATES_MONTHS] WHERE
		[m] = @M
GO
