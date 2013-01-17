SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'NEWS' table using the primary key value.
CREATE PROCEDURE [dbo].[_NEWS_GetByPrimaryKey]
	@NEWSID int
AS
	SELECT * FROM [dbo].[NEWS] WHERE
		[NEWSID] = @NEWSID
GO
