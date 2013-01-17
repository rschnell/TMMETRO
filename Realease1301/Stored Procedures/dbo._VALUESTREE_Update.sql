SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'VALUESTREE' table.
CREATE PROCEDURE [dbo].[_VALUESTREE_Update]
	-- The rest of writeable parameters
	@CATEGORYID int,
	@NODENAME nvarchar(50),
	@Default bit,
	@TREELN int,
	@TREERN int,
	@ACTIVE bit,
	-- Primary key parameters
	@TREEID int
AS
	UPDATE [dbo].[VALUESTREE] SET
		[CATEGORYID] = @CATEGORYID,
		[NODENAME] = @NODENAME,
		[Default] = @Default,
		[TREELN] = @TREELN,
		[TREERN] = @TREERN,
		[ACTIVE] = @ACTIVE
	WHERE
		[TREEID] = @TREEID
GO
