SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'ACTIONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_ACTIONS_GetByPrimaryKey]
	@ACTIONID int
AS
	SELECT * FROM [dbo].[ACTIONS] WHERE
		[ACTIONID] = @ACTIONID
GO
