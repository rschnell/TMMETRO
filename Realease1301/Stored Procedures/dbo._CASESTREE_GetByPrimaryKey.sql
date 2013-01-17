SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CASESTREE' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESTREE_GetByPrimaryKey]
	@TREEID int
AS
	SELECT * FROM [dbo].[CASESTREE] WHERE
		[TREEID] = @TREEID
GO
