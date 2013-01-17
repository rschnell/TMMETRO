SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SUMMARIES' table using the primary key value.
CREATE PROCEDURE [dbo].[_SUMMARIES_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[SUMMARIES] WHERE
		[ID] = @ID
GO
