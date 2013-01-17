SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'NEWS' table.
CREATE PROCEDURE [dbo].[_NEWS_Update]
	-- The rest of writeable parameters
	@NEWSDATE datetime,
	@TITLE nvarchar(max),
	@BODY nvarchar(max),
	@ACTIVE bit,
	@UPDATEDBY int,
	@UPDATEDATE datetime,
	@LANG nchar(5),
	-- Primary key parameters
	@NEWSID int
AS
	UPDATE [dbo].[NEWS] SET
		[NEWSDATE] = @NEWSDATE,
		[TITLE] = @TITLE,
		[BODY] = @BODY,
		[ACTIVE] = @ACTIVE,
		[UPDATEDBY] = @UPDATEDBY,
		[UPDATEDATE] = @UPDATEDATE,
		[LANG] = @LANG
	WHERE
		[NEWSID] = @NEWSID
GO
