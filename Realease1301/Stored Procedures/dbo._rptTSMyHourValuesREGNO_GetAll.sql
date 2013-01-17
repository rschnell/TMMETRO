SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSMyHourValuesREGNO' table.
CREATE PROCEDURE [dbo].[_rptTSMyHourValuesREGNO_GetAll]
AS
	SELECT * FROM [dbo].[rptTSMyHourValuesREGNO]
GO
