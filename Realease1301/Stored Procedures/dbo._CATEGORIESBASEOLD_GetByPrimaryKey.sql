SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'CATEGORIESBASEOLD' table using the primary key value.
CREATE PROCEDURE [dbo].[_CATEGORIESBASEOLD_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[CATEGORIESBASEOLD] WHERE
		[ID] = @ID
GO
