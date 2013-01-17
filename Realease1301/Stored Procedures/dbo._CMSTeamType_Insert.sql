SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'CMSTeamType' table.
CREATE PROCEDURE [dbo].[_CMSTeamType_Insert]
	@NoInvitees int,
	@MultiTeam bit,
	@NoCases int,
	@NoGigabytes float,
	@TypeName nvarchar(40),
	@NoActions int
AS
	INSERT INTO [dbo].[CMSTeamType]
	(
		[NoInvitees],
		[MultiTeam],
		[NoCases],
		[NoGigabytes],
		[TypeName],
		[NoActions]
	)
	VALUES
	(
		@NoInvitees,
		@MultiTeam,
		@NoCases,
		@NoGigabytes,
		@TypeName,
		@NoActions
	)
	SELECT @@IDENTITY
GO
