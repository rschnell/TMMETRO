SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSPersonCasesRaised' table.
CREATE PROCEDURE [dbo].[_rptTSPersonCasesRaised_GetAll]
AS
	SELECT * FROM [dbo].[rptTSPersonCasesRaised]
GO
