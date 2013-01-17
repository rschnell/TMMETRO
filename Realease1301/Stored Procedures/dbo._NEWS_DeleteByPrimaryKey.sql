SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'NEWS' table using the primary key value.
CREATE PROCEDURE [dbo].[_NEWS_DeleteByPrimaryKey]
	@NEWSID int
AS
	DELETE FROM [dbo].[NEWS] WHERE
		[NEWSID] = @NEWSID
GO
