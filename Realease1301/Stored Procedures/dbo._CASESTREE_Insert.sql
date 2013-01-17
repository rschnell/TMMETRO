SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'CASESTREE' table.
CREATE PROCEDURE [dbo].[_CASESTREE_Insert]
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
	@RATE numeric(18,2)
AS
	INSERT INTO [dbo].[CASESTREE]
	(
		[CATEGORYID],
		[NODENAME],
		[NODEVALUE],
		[NODETEXT],
		[DEFAULT],
		[TREELEVEL],
		[TREELN],
		[TREERN],
		[ACTIVE],
		[NODETAG],
		[PARENTID],
		[NODEID],
		[RATE]
	)
	VALUES
	(
		@CATEGORYID,
		@NODENAME,
		@NODEVALUE,
		@NODETEXT,
		@DEFAULT,
		@TREELEVEL,
		@TREELN,
		@TREERN,
		@ACTIVE,
		@NODETAG,
		@PARENTID,
		@NODEID,
		@RATE
	)
	SELECT @@IDENTITY
GO