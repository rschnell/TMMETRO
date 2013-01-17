SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CASESTREE' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESTREE_DeleteByPrimaryKey]
	@TREEID int
AS
	DELETE FROM [dbo].[CASESTREE] WHERE
		[TREEID] = @TREEID
GO
