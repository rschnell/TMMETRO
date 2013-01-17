SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CATEGORIESBASE' table using the primary key value.
CREATE PROCEDURE [dbo].[_CATEGORIESBASE_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CATEGORIESBASE] WHERE
		[ID] = @ID
GO
