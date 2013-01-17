SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'USERSEXTENDED' table.
CREATE PROCEDURE [dbo].[_USERSEXTENDED_Update]
	-- The rest of writeable parameters
	@IsISManager bit,
	@IsTMManager bit,
	@IsTMAdmin bit,
	@AgencyID int,
	@IsDetective bit,
	-- Primary key parameters
	@USERID int
AS
	UPDATE [dbo].[USERSEXTENDED] SET
		[IsISManager] = @IsISManager,
		[IsTMManager] = @IsTMManager,
		[IsTMAdmin] = @IsTMAdmin,
		[AgencyID] = @AgencyID,
		[IsDetective] = @IsDetective
	WHERE
		[USERID] = @USERID
GO
