SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'VALUESTREE' table.
CREATE PROCEDURE [dbo].[_VALUESTREE_Insert]
	@CATEGORYID int,
	@NODENAME nvarchar(50),
	@Default bit,
	@TREELN int,
	@TREERN int,
	@ACTIVE bit
AS
	INSERT INTO [dbo].[VALUESTREE]
	(
		[CATEGORYID],
		[NODENAME],
		[Default],
		[TREELN],
		[TREERN],
		[ACTIVE]
	)
	VALUES
	(
		@CATEGORYID,
		@NODENAME,
		@Default,
		@TREELN,
		@TREERN,
		@ACTIVE
	)
	SELECT @@IDENTITY
GO
