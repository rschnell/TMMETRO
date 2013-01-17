SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'RELATIONSHIPS' table using the primary key value.
CREATE PROCEDURE [dbo].[_RELATIONSHIPS_DeleteByPrimaryKey]
	@RELID int
AS
	DELETE FROM [dbo].[RELATIONSHIPS] WHERE
		[RELID] = @RELID
GO
