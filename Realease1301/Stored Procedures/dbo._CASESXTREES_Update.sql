SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'CASESXTREES' table.
CREATE PROCEDURE [dbo].[_CASESXTREES_Update]
	-- The rest of writeable parameters
	@CASEID int,
	@ACTIONID int,
	@TREEID int,
	@CATEGORYID int,
	@NODEVALUE int,
	@NODENUMBER numeric(18,2),
	@NODENAME nvarchar(max),
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[CASESXTREES] SET
		[CASEID] = @CASEID,
		[ACTIONID] = @ACTIONID,
		[TREEID] = @TREEID,
		[CATEGORYID] = @CATEGORYID,
		[NODEVALUE] = @NODEVALUE,
		[NODENUMBER] = @NODENUMBER,
		[NODENAME] = @NODENAME
	WHERE
		[ID] = @ID
GO
