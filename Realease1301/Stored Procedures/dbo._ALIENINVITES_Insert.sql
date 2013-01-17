SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'ALIENINVITES' table.
CREATE PROCEDURE [dbo].[_ALIENINVITES_Insert]
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
	@LastUseDate datetime
AS
	INSERT INTO [dbo].[ALIENINVITES]
	(
		[InviteDate],
		[Email],
		[SkypeHandle],
		[SubscriptionID],
		[CaseID],
		[ActionID],
		[UserID],
		[Message],
		[URL],
		[SecurityCode],
		[Password],
		[Active],
		[InviteeID],
		[LastUseDate]
	)
	VALUES
	(
		@InviteDate,
		@Email,
		@SkypeHandle,
		@SubscriptionID,
		@CaseID,
		@ActionID,
		@UserID,
		@Message,
		@URL,
		@SecurityCode,
		@Password,
		@Active,
		@InviteeID,
		@LastUseDate
	)
	SELECT @@IDENTITY
GO
