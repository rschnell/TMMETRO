SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'NOTES' table using the primary key value.
CREATE PROCEDURE [dbo].[_NOTES_GetByPrimaryKey]
	@NOTESID int
AS
	SELECT * FROM [dbo].[NOTES] WHERE
		[NOTESID] = @NOTESID
GO
