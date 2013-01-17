SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSGroupByEntry' table.
CREATE PROCEDURE [dbo].[_rptTSGroupByEntry_GetAll]
AS
	SELECT * FROM [dbo].[rptTSGroupByEntry]
GO
