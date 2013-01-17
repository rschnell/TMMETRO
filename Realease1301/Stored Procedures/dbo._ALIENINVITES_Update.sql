SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'ALIENINVITES' table.
CREATE PROCEDURE [dbo].[_ALIENINVITES_Update]
	-- The rest of writeable parameters
	@InviteDate datetime,
	@Email varchar(1000),
	@SkypeHandle varchar(50),
	@SubscriptionID int,
	@CaseID int,
	@ActionID int,
	@UserID int,
	@Message varchar(max),
	@URL varchar(1000),
	@SecurityCode varchar(50),
	@Password varchar(50),
	@Active bit,
	@InviteeID int,
	@LastUseDate datetime,
	-- Primary key parameters
	@AlienInvitesID int
AS
	UPDATE [dbo].[ALIENINVITES] SET
		[InviteDate] = @InviteDate,
		[Email] = @Email,
		[SkypeHandle] = @SkypeHandle,
		[SubscriptionID] = @SubscriptionID,
		[CaseID] = @CaseID,
		[ActionID] = @ActionID,
		[UserID] = @UserID,
		[Message] = @Message,
		[URL] = @URL,
		[SecurityCode] = @SecurityCode,
		[Password] = @Password,
		[Active] = @Active,
		[InviteeID] = @InviteeID,
		[LastUseDate] = @LastUseDate
	WHERE
		[AlienInvitesID] = @AlienInvitesID
GO
