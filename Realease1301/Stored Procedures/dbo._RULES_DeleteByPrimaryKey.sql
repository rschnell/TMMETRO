SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'RULES' table using the primary key value.
CREATE PROCEDURE [dbo].[_RULES_DeleteByPrimaryKey]
	@RULESID int
AS
	DELETE FROM [dbo].[RULES] WHERE
		[RULESID] = @RULESID
GO
