SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'CMSTeamType' table.
CREATE PROCEDURE [dbo].[_CMSTeamType_Update]
	-- The rest of writeable parameters
	@NoInvitees int,
	@MultiTeam bit,
	@NoCases int,
	@NoGigabytes float,
	@TypeName nvarchar(40),
	@NoActions int,
	-- Primary key parameters
	@TeamTypeID int
AS
	UPDATE [dbo].[CMSTeamType] SET
		[NoInvitees] = @NoInvitees,
		[MultiTeam] = @MultiTeam,
		[NoCases] = @NoCases,
		[NoGigabytes] = @NoGigabytes,
		[TypeName] = @TypeName,
		[NoActions] = @NoActions
	WHERE
		[TeamTypeID] = @TeamTypeID
GO
