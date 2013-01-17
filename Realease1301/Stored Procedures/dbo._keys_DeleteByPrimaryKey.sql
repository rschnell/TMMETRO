SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'keys' table using the primary key value.
CREATE PROCEDURE [dbo].[_keys_DeleteByPrimaryKey]
	@KeyID int
AS
	DELETE FROM [dbo].[keys] WHERE
		[keyID] = @KeyID
GO
