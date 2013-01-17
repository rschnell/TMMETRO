SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'SkypeNOTIFY' table.
CREATE PROCEDURE [dbo].[_SkypeNOTIFY_Insert]
	@DiaryID int,
	@NotifyTime datetime,
	@SkypeHandle varchar(50),
	@UserID int,
	@Message text,
	@URL varchar(1000)
AS
	INSERT INTO [dbo].[SkypeNOTIFY]
	(
		[DiaryID],
		[NotifyTime],
		[SkypeHandle],
		[UserID],
		[Message],
		[URL]
	)
	VALUES
	(
		@DiaryID,
		@NotifyTime,
		@SkypeHandle,
		@UserID,
		@Message,
		@URL
	)
	SELECT @@IDENTITY
GO
