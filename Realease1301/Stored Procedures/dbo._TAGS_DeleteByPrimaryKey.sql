SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'TAGS' table using the primary key value.
CREATE PROCEDURE [dbo].[_TAGS_DeleteByPrimaryKey]
	@TAGID int
AS
	DELETE FROM [dbo].[TAGS] WHERE
		[TAGID] = @TAGID
GO
