SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'keys' table.
CREATE PROCEDURE [dbo].[_keys_Update]
	-- The rest of writeable parameters
	@DocID int,
	@KeyData char(25),
	@KeyExpires datetime,
	-- Primary key parameters
	@KeyID int
AS
	UPDATE [dbo].[keys] SET
		[docID] = @DocID,
		[keyData] = @KeyData,
		[keyExpires] = @KeyExpires
	WHERE
		[keyID] = @KeyID
GO
