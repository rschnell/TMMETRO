SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'SUMMARIES' table.
CREATE PROCEDURE [dbo].[_SUMMARIES_Insert]
	@Title nvarchar(max),
	@SQL nvarchar(max),
	@Description nvarchar(max),
	@EXT nvarchar(50),
	@PREFIX nvarchar(50),
	@SCOPE nvarchar(max),
	@DATECREATED datetime,
	@DATEUPDATED datetime,
	@VERSION int,
	@Active bit,
	@IsAdmin bit,
	@Path nvarchar(300)
AS
	INSERT INTO [dbo].[SUMMARIES]
	(
		[Title],
		[SQL],
		[Description],
		[EXT],
		[PREFIX],
		[SCOPE],
		[DATECREATED],
		[DATEUPDATED],
		[VERSION],
		[Active],
		[IsAdmin],
		[Path]
	)
	VALUES
	(
		@Title,
		@SQL,
		@Description,
		@EXT,
		@PREFIX,
		@SCOPE,
		@DATECREATED,
		@DATEUPDATED,
		@VERSION,
		@Active,
		@IsAdmin,
		@Path
	)
	SELECT @@IDENTITY
GO
