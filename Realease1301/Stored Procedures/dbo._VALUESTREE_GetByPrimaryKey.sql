SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'VALUESTREE' table using the primary key value.
CREATE PROCEDURE [dbo].[_VALUESTREE_GetByPrimaryKey]
	@TREEID int
AS
	SELECT * FROM [dbo].[VALUESTREE] WHERE
		[TREEID] = @TREEID
GO
