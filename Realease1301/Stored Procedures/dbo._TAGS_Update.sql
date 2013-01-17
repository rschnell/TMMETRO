SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'TAGS' table.
CREATE PROCEDURE [dbo].[_TAGS_Update]
	-- The rest of writeable parameters
	@TAG nvarchar(50),
	-- Primary key parameters
	@TAGID int
AS
	UPDATE [dbo].[TAGS] SET
		[TAG] = @TAG
	WHERE
		[TAGID] = @TAGID
GO
