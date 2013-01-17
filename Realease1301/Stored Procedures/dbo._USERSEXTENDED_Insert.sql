SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'USERSEXTENDED' table.
CREATE PROCEDURE [dbo].[_USERSEXTENDED_Insert]
	@USERID int,
	@IsISManager bit,
	@IsTMManager bit,
	@IsTMAdmin bit,
	@AgencyID int,
	@IsDetective bit
AS
	INSERT INTO [dbo].[USERSEXTENDED]
	(
		[USERID],
		[IsISManager],
		[IsTMManager],
		[IsTMAdmin],
		[AgencyID],
		[IsDetective]
	)
	VALUES
	(
		@USERID,
		@IsISManager,
		@IsTMManager,
		@IsTMAdmin,
		@AgencyID,
		@IsDetective
	)
GO
