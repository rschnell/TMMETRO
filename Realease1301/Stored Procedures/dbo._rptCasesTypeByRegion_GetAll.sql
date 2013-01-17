SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptCasesTypeByRegion' table.
CREATE PROCEDURE [dbo].[_rptCasesTypeByRegion_GetAll]
AS
	SELECT * FROM [dbo].[rptCasesTypeByRegion]
GO
