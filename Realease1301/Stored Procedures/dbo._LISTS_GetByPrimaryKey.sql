SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'LISTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_LISTS_GetByPrimaryKey]
	@LISTID int
AS
	SELECT * FROM [dbo].[LISTS] WHERE
		[LISTID] = @LISTID
GO
