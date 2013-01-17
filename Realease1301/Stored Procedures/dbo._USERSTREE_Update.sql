SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'USERSTREE' table.
CREATE PROCEDURE [dbo].[_USERSTREE_Update]
	-- The rest of writeable parameters
	@CATEGORYID int,
	@NODENAME nchar(50),
	@PARENTID int,
	@LEVELTYPE nchar(50),
	@DEFAULT bit,
	@TREELN int,
	@TREERN int,
	@RELATIVE int,
	-- Primary key parameters
	@TREEID int
AS
	UPDATE [dbo].[USERSTREE] SET
		[CATEGORYID] = @CATEGORYID,
		[NODENAME] = @NODENAME,
		[PARENTID] = @PARENTID,
		[LEVELTYPE] = @LEVELTYPE,
		[DEFAULT] = @DEFAULT,
		[TREELN] = @TREELN,
		[TREERN] = @TREERN,
		[RELATIVE] = @RELATIVE
	WHERE
		[TREEID] = @TREEID
GO
