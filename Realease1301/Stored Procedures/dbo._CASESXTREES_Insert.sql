SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'CASESXTREES' table.
CREATE PROCEDURE [dbo].[_CASESXTREES_Insert]
	@CASEID int,
	@ACTIONID int,
	@TREEID int,
	@CATEGORYID int,
	@NODEVALUE int,
	@NODENUMBER numeric(18,2),
	@NODENAME nvarchar(max)
AS
	INSERT INTO [dbo].[CASESXTREES]
	(
		[CASEID],
		[ACTIONID],
		[TREEID],
		[CATEGORYID],
		[NODEVALUE],
		[NODENUMBER],
		[NODENAME]
	)
	VALUES
	(
		@CASEID,
		@ACTIONID,
		@TREEID,
		@CATEGORYID,
		@NODEVALUE,
		@NODENUMBER,
		@NODENAME
	)
	SELECT @@IDENTITY
GO
