SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'ERRORS' table using the primary key value.
CREATE PROCEDURE [dbo].[_ERRORS_DeleteByPrimaryKey]
	@ErrorID int
AS
	DELETE FROM [dbo].[ERRORS] WHERE
		[ErrorID] = @ErrorID
GO
