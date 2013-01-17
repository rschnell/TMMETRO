SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'ACTIONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_ACTIONS_DeleteByPrimaryKey]
	@ACTIONID int
AS
	DELETE FROM [dbo].[ACTIONS] WHERE
		[ACTIONID] = @ACTIONID
GO
