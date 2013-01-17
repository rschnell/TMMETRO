SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'NOTES' table using the primary key value.
CREATE PROCEDURE [dbo].[_NOTES_DeleteByPrimaryKey]
	@NOTESID int
AS
	DELETE FROM [dbo].[NOTES] WHERE
		[NOTESID] = @NOTESID
GO
