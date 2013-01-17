SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSTimesheets' table.
CREATE PROCEDURE [dbo].[_rptTSTimesheets_GetAll]
AS
	SELECT * FROM [dbo].[rptTSTimesheets]
GO
