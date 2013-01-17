SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'NEWS' table.
CREATE PROCEDURE [dbo].[_NEWS_Insert]
	@NEWSDATE datetime,
	@TITLE nvarchar(max),
	@BODY nvarchar(max),
	@ACTIVE bit,
	@UPDATEDBY int,
	@UPDATEDATE datetime,
	@LANG nchar(5)
AS
	INSERT INTO [dbo].[NEWS]
	(
		[NEWSDATE],
		[TITLE],
		[BODY],
		[ACTIVE],
		[UPDATEDBY],
		[UPDATEDATE],
		[LANG]
	)
	VALUES
	(
		@NEWSDATE,
		@TITLE,
		@BODY,
		@ACTIVE,
		@UPDATEDBY,
		@UPDATEDATE,
		@LANG
	)
	SELECT @@IDENTITY
GO
