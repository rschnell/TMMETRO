SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'REFERENCES' table using the primary key value.
CREATE PROCEDURE [dbo].[_REFERENCES_DeleteByPrimaryKey]
	@REFID int
AS
	DELETE FROM [dbo].[REFERENCES] WHERE
		[REFID] = @REFID
GO
