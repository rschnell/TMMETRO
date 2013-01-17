SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'SUMMARIES' table.
CREATE PROCEDURE [dbo].[_SUMMARIES_Update]
	-- The rest of writeable parameters
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
	@Path nvarchar(300),
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[SUMMARIES] SET
		[Title] = @Title,
		[SQL] = @SQL,
		[Description] = @Description,
		[EXT] = @EXT,
		[PREFIX] = @PREFIX,
		[SCOPE] = @SCOPE,
		[DATECREATED] = @DATECREATED,
		[DATEUPDATED] = @DATEUPDATED,
		[VERSION] = @VERSION,
		[Active] = @Active,
		[IsAdmin] = @IsAdmin,
		[Path] = @Path
	WHERE
		[ID] = @ID
GO
