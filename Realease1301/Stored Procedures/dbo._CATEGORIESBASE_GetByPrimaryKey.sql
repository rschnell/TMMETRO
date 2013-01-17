SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CATEGORIESBASE' table using the primary key value.
CREATE PROCEDURE [dbo].[_CATEGORIESBASE_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[CATEGORIESBASE] WHERE
		[ID] = @ID
GO
