SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'ERRORS' table using the primary key value.
CREATE PROCEDURE [dbo].[_ERRORS_GetByPrimaryKey]
	@ErrorID int
AS
	SELECT * FROM [dbo].[ERRORS] WHERE
		[ErrorID] = @ErrorID
GO
