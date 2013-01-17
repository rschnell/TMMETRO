SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CASESTREEBASE' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESTREEBASE_DeleteByPrimaryKey]
	@TREEID int
AS
	DELETE FROM [dbo].[CASESTREEBASE] WHERE
		[TREEID] = @TREEID
GO
