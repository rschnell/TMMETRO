SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'MailNOTIFY' table.
CREATE PROCEDURE [dbo].[_MailNOTIFY_Update]
	-- The rest of writeable parameters
	@DiaryID int,
	@NotifyTime datetime,
	@Email varchar(1000),
	@UserID int,
	@Message text,
	@URL varchar(1000),
	-- Primary key parameters
	@MailNOTIFYID int
AS
	UPDATE [dbo].[MailNOTIFY] SET
		[DiaryID] = @DiaryID,
		[NotifyTime] = @NotifyTime,
		[Email] = @Email,
		[UserID] = @UserID,
		[Message] = @Message,
		[URL] = @URL
	WHERE
		[MailNOTIFYID] = @MailNOTIFYID
GO
