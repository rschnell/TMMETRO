SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'USERSTREE' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERSTREE_DeleteByPrimaryKey]
	@TREEID int
AS
	DELETE FROM [dbo].[USERSTREE] WHERE
		[TREEID] = @TREEID
GO
