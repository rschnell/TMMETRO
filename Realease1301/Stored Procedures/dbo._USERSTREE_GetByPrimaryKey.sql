SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'USERSTREE' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERSTREE_GetByPrimaryKey]
	@TREEID int
AS
	SELECT * FROM [dbo].[USERSTREE] WHERE
		[TREEID] = @TREEID
GO
