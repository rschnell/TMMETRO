SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CATEGORIES' table using the primary key value.
CREATE PROCEDURE [dbo].[_CATEGORIES_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[CATEGORIES] WHERE
		[ID] = @ID
GO
