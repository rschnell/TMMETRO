SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'SkypeNOTIFY' table.
CREATE PROCEDURE [dbo].[_SkypeNOTIFY_Update]
	-- The rest of writeable parameters
	@DiaryID int,
	@NotifyTime datetime,
	@SkypeHandle varchar(50),
	@UserID int,
	@Message text,
	@URL varchar(1000),
	-- Primary key parameters
	@SkypeNotifyID int
AS
	UPDATE [dbo].[SkypeNOTIFY] SET
		[DiaryID] = @DiaryID,
		[NotifyTime] = @NotifyTime,
		[SkypeHandle] = @SkypeHandle,
		[UserID] = @UserID,
		[Message] = @Message,
		[URL] = @URL
	WHERE
		[SkypeNotifyID] = @SkypeNotifyID
GO
