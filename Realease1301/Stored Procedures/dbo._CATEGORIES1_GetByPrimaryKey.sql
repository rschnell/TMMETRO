SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'CATEGORIES1' table using the primary key value.
CREATE PROCEDURE [dbo].[_CATEGORIES1_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[CATEGORIES1] WHERE
		[ID] = @ID
GO
