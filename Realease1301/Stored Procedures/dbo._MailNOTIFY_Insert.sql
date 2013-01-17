SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'MailNOTIFY' table.
CREATE PROCEDURE [dbo].[_MailNOTIFY_Insert]
	@DiaryID int,
	@NotifyTime datetime,
	@Email varchar(1000),
	@UserID int,
	@Message text,
	@URL varchar(1000)
AS
	INSERT INTO [dbo].[MailNOTIFY]
	(
		[DiaryID],
		[NotifyTime],
		[Email],
		[UserID],
		[Message],
		[URL]
	)
	VALUES
	(
		@DiaryID,
		@NotifyTime,
		@Email,
		@UserID,
		@Message,
		@URL
	)
	SELECT @@IDENTITY
GO
