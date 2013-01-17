SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSCasesRaised' table.
CREATE PROCEDURE [dbo].[_rptTSCasesRaised_GetAll]
AS
	SELECT * FROM [dbo].[rptTSCasesRaised]
GO
