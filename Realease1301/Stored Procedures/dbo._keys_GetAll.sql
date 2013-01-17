SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets all records from the 'keys' table.
CREATE PROCEDURE [dbo].[_keys_GetAll]
AS
	SELECT * FROM [dbo].[keys]
GO
