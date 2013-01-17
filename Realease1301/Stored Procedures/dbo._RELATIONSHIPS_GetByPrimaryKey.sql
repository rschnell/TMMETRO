SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'RELATIONSHIPS' table using the primary key value.
CREATE PROCEDURE [dbo].[_RELATIONSHIPS_GetByPrimaryKey]
	@RELID int
AS
	SELECT * FROM [dbo].[RELATIONSHIPS] WHERE
		[RELID] = @RELID
GO
