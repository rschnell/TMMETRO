SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSGroupActivityByCase' table.
CREATE PROCEDURE [dbo].[_rptTSGroupActivityByCase_GetAll]
AS
	SELECT * FROM [dbo].[rptTSGroupActivityByCase]
GO
