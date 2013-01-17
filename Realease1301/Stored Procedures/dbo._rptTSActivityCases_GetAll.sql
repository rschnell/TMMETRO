SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSActivityCases' table.
CREATE PROCEDURE [dbo].[_rptTSActivityCases_GetAll]
AS
	SELECT * FROM [dbo].[rptTSActivityCases]
GO
