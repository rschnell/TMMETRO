SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CATEGORIES' table using the primary key value.
CREATE PROCEDURE [dbo].[_CATEGORIES_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CATEGORIES] WHERE
		[ID] = @ID
GO
