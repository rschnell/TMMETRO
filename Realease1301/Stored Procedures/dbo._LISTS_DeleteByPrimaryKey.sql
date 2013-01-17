SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'LISTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_LISTS_DeleteByPrimaryKey]
	@LISTID int
AS
	DELETE FROM [dbo].[LISTS] WHERE
		[LISTID] = @LISTID
GO
