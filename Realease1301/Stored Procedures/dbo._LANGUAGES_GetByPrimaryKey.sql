SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'LANGUAGES' table using the primary key value.
CREATE PROCEDURE [dbo].[_LANGUAGES_GetByPrimaryKey]
	@LANGID int
AS
	SELECT * FROM [dbo].[LANGUAGES] WHERE
		[LANGID] = @LANGID
GO
