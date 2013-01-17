SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'keys' table.
CREATE PROCEDURE [dbo].[_keys_DeleteAll]
AS
	DELETE FROM [dbo].[keys]
GO
