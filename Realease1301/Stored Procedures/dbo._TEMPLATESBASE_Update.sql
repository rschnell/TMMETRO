SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'TEMPLATESBASE' table.
CREATE PROCEDURE [dbo].[_TEMPLATESBASE_Update]
	-- The rest of writeable parameters
	@TEMPLATEID int,
	@TEMPLATENAME nchar(50),
	@COMMENT nchar(50),
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[TEMPLATESBASE] SET
		[TEMPLATEID] = @TEMPLATEID,
		[TEMPLATENAME] = @TEMPLATENAME,
		[COMMENT] = @COMMENT
	WHERE
		[ID] = @ID
GO
