SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SUBRIGHTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_SUBRIGHTS_DeleteByPrimaryKey]
	@SUBRIGHTSID int
AS
	DELETE FROM [dbo].[SUBRIGHTS] WHERE
		[SUBRIGHTSID] = @SUBRIGHTSID
GO