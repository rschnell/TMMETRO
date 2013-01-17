SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'OLAPCases' table.
CREATE PROCEDURE [dbo].[_OLAPCases_GetAll]
AS
	SELECT * FROM [dbo].[OLAPCases]
GO
