SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptHrCountCases' table.
CREATE PROCEDURE [dbo].[_rptHrCountCases_GetAll]
AS
	SELECT * FROM [dbo].[rptHrCountCases]
GO
