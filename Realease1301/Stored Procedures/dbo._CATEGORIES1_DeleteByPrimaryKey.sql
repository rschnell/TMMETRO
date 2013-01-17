SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'CATEGORIES1' table using the primary key value.
CREATE PROCEDURE [dbo].[_CATEGORIES1_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CATEGORIES1] WHERE
		[ID] = @ID
GO
