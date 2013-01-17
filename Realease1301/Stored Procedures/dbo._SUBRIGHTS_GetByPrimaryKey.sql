SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SUBRIGHTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_SUBRIGHTS_GetByPrimaryKey]
	@SUBRIGHTSID int
AS
	SELECT * FROM [dbo].[SUBRIGHTS] WHERE
		[SUBRIGHTSID] = @SUBRIGHTSID
GO
