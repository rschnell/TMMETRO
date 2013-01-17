SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'BASICTREE' table using the primary key value.
CREATE PROCEDURE [dbo].[_BASICTREE_GetByPrimaryKey]
	@TREEID int
AS
	SELECT * FROM [dbo].[BASICTREE] WHERE
		[TREEID] = @TREEID
GO
