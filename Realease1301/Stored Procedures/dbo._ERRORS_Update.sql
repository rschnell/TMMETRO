SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'ERRORS' table.
CREATE PROCEDURE [dbo].[_ERRORS_Update]
	-- The rest of writeable parameters
	@LocalID int,
	@ErrorDescription nvarchar(500),
	-- Primary key parameters
	@ErrorID int
AS
	UPDATE [dbo].[ERRORS] SET
		[LocalID] = @LocalID,
		[ErrorDescription] = @ErrorDescription
	WHERE
		[ErrorID] = @ErrorID
GO
