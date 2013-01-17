SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'REPORTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_REPORTS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[REPORTS] WHERE
		[ID] = @ID
GO
