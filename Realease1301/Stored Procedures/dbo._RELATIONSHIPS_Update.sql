SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'RELATIONSHIPS' table.
CREATE PROCEDURE [dbo].[_RELATIONSHIPS_Update]
	-- The rest of writeable parameters
	@CATEGORYID int,
	@RELNAME nchar(20),
	@RELDESC nvarchar(max),
	@DISPLAYNAME nchar(50),
	-- Primary key parameters
	@RELID int
AS
	UPDATE [dbo].[RELATIONSHIPS] SET
		[CATEGORYID] = @CATEGORYID,
		[RELNAME] = @RELNAME,
		[RELDESC] = @RELDESC,
		[DISPLAYNAME] = @DISPLAYNAME
	WHERE
		[RELID] = @RELID
GO
