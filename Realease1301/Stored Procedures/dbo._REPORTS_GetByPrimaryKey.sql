SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'REPORTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_REPORTS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[REPORTS] WHERE
		[ID] = @ID
GO
