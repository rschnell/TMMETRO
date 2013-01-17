SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'REFERENCES' table using the primary key value.
CREATE PROCEDURE [dbo].[_REFERENCES_GetByPrimaryKey]
	@REFID int
AS
	SELECT * FROM [dbo].[REFERENCES] WHERE
		[REFID] = @REFID
GO
