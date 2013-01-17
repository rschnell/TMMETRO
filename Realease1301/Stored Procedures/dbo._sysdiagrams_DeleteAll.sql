SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'sysdiagrams' table.
CREATE PROCEDURE [dbo].[_sysdiagrams_DeleteAll]
AS
	DELETE FROM [dbo].[sysdiagrams]
GO
