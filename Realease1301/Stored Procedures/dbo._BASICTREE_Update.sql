SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'BASICTREE' table.
CREATE PROCEDURE [dbo].[_BASICTREE_Update]
	-- The rest of writeable parameters
	@CATEGORYID int,
	@NODENAME nvarchar(50),
	@NODEVALUE int,
	@NODETEXT nvarchar(max),
	@DEFAULT bit,
	@TREELEVEL int,
	@TREELN int,
	@TREERN int,
	@ACTIVE bit,
	-- Primary key parameters
	@TREEID int
AS
	UPDATE [dbo].[BASICTREE] SET
		[CATEGORYID] = @CATEGORYID,
		[NODENAME] = @NODENAME,
		[NODEVALUE] = @NODEVALUE,
		[NODETEXT] = @NODETEXT,
		[DEFAULT] = @DEFAULT,
		[TREELEVEL] = @TREELEVEL,
		[TREELN] = @TREELN,
		[TREERN] = @TREERN,
		[ACTIVE] = @ACTIVE
	WHERE
		[TREEID] = @TREEID
GO
