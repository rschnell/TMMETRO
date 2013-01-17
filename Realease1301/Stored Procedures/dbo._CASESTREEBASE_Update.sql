SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'CASESTREEBASE' table.
CREATE PROCEDURE [dbo].[_CASESTREEBASE_Update]
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
	@NODETAG nvarchar(50),
	@PARENTID int,
	@NODEID int,
	-- Primary key parameters
	@TREEID int
AS
	UPDATE [dbo].[CASESTREEBASE] SET
		[CATEGORYID] = @CATEGORYID,
		[NODENAME] = @NODENAME,
		[NODEVALUE] = @NODEVALUE,
		[NODETEXT] = @NODETEXT,
		[DEFAULT] = @DEFAULT,
		[TREELEVEL] = @TREELEVEL,
		[TREELN] = @TREELN,
		[TREERN] = @TREERN,
		[ACTIVE] = @ACTIVE,
		[NODETAG] = @NODETAG,
		[PARENTID] = @PARENTID,
		[NODEID] = @NODEID
	WHERE
		[TREEID] = @TREEID
GO
