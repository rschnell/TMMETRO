SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'DATES_DAYS' table using the primary key value.
CREATE PROCEDURE [dbo].[_DATES_DAYS_DeleteByPrimaryKey]
	@D date
AS
	DELETE FROM [dbo].[DATES_DAYS] WHERE
		[d] = @D
GO
