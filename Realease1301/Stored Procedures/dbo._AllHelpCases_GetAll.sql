SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'AllHelpCases' table.
CREATE PROCEDURE [dbo].[_AllHelpCases_GetAll]
AS
	SELECT * FROM [dbo].[AllHelpCases]
GO
