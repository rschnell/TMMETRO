SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'THEMES' table using the primary key value.
CREATE PROCEDURE [dbo].[_THEMES_DeleteByPrimaryKey]
	@THEMEID int
AS
	DELETE FROM [dbo].[THEMES] WHERE
		[THEMEID] = @THEMEID
GO
