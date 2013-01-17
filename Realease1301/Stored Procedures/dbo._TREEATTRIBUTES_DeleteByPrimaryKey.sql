SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'TREEATTRIBUTES' table using the primary key value.
CREATE PROCEDURE [dbo].[_TREEATTRIBUTES_DeleteByPrimaryKey]
	@ATTID int
AS
	DELETE FROM [dbo].[TREEATTRIBUTES] WHERE
		[ATTID] = @ATTID
GO
