SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'VALUESTREE' table using the primary key value.
CREATE PROCEDURE [dbo].[_VALUESTREE_DeleteByPrimaryKey]
	@TREEID int
AS
	DELETE FROM [dbo].[VALUESTREE] WHERE
		[TREEID] = @TREEID
GO
