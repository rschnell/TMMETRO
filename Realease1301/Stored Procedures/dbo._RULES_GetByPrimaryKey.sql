SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'RULES' table using the primary key value.
CREATE PROCEDURE [dbo].[_RULES_GetByPrimaryKey]
	@RULESID int
AS
	SELECT * FROM [dbo].[RULES] WHERE
		[RULESID] = @RULESID
GO
