SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'keys' table.
CREATE PROCEDURE [dbo].[_keys_Insert]
	@DocID int,
	@KeyData char(25),
	@KeyExpires datetime
AS
	INSERT INTO [dbo].[keys]
	(
		[docID],
		[keyData],
		[keyExpires]
	)
	VALUES
	(
		@DocID,
		@KeyData,
		@KeyExpires
	)
	SELECT @@IDENTITY
GO
