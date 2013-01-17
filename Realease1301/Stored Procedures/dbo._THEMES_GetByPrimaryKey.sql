SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'THEMES' table using the primary key value.
CREATE PROCEDURE [dbo].[_THEMES_GetByPrimaryKey]
	@THEMEID int
AS
	SELECT * FROM [dbo].[THEMES] WHERE
		[THEMEID] = @THEMEID
GO
