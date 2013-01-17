SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'sysdiagrams' table.
CREATE PROCEDURE [dbo].[_sysdiagrams_GetAll]
AS
	SELECT * FROM [dbo].[sysdiagrams]
GO
