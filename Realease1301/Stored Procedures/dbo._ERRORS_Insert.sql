SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'ERRORS' table.
CREATE PROCEDURE [dbo].[_ERRORS_Insert]
	@ErrorID int,
	@LocalID int,
	@ErrorDescription nvarchar(500)
AS
	INSERT INTO [dbo].[ERRORS]
	(
		[ErrorID],
		[LocalID],
		[ErrorDescription]
	)
	VALUES
	(
		@ErrorID,
		@LocalID,
		@ErrorDescription
	)
GO
