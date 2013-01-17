SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSGroupByCase' table.
CREATE PROCEDURE [dbo].[_rptTSGroupByCase_GetAll]
AS
	SELECT * FROM [dbo].[rptTSGroupByCase]
GO
