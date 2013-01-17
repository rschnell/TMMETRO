SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'POILOG' table using the primary key value.
CREATE PROCEDURE [dbo].[_POILOG_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[POILOG] WHERE
		[ID] = @ID
GO
