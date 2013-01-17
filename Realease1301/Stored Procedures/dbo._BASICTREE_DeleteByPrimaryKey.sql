SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'BASICTREE' table using the primary key value.
CREATE PROCEDURE [dbo].[_BASICTREE_DeleteByPrimaryKey]
	@TREEID int
AS
	DELETE FROM [dbo].[BASICTREE] WHERE
		[TREEID] = @TREEID
GO
