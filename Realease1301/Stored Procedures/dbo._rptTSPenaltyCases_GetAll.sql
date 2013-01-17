SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSPenaltyCases' table.
CREATE PROCEDURE [dbo].[_rptTSPenaltyCases_GetAll]
AS
	SELECT * FROM [dbo].[rptTSPenaltyCases]
GO
