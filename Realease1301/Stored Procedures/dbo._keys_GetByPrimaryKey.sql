SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'keys' table using the primary key value.
CREATE PROCEDURE [dbo].[_keys_GetByPrimaryKey]
	@KeyID int
AS
	SELECT * FROM [dbo].[keys] WHERE
		[keyID] = @KeyID
GO
