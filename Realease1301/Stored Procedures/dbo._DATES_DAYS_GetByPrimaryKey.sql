SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'DATES_DAYS' table using the primary key value.
CREATE PROCEDURE [dbo].[_DATES_DAYS_GetByPrimaryKey]
	@D date
AS
	SELECT * FROM [dbo].[DATES_DAYS] WHERE
		[d] = @D
GO
