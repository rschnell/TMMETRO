SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'LANGUAGES' table using the primary key value.
CREATE PROCEDURE [dbo].[_LANGUAGES_DeleteByPrimaryKey]
	@LANGID int
AS
	DELETE FROM [dbo].[LANGUAGES] WHERE
		[LANGID] = @LANGID
GO
