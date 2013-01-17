SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'CATEGORIESBASEOLD' table using the primary key value.
CREATE PROCEDURE [dbo].[_CATEGORIESBASEOLD_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CATEGORIESBASEOLD] WHERE
		[ID] = @ID
GO
