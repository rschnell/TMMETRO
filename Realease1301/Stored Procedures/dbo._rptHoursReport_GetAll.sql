SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptHoursReport' table.
CREATE PROCEDURE [dbo].[_rptHoursReport_GetAll]
AS
	SELECT * FROM [dbo].[rptHoursReport]
GO
