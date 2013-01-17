SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSPenalties' table.
CREATE PROCEDURE [dbo].[_rptTSPenalties_GetAll]
AS
	SELECT * FROM [dbo].[rptTSPenalties]
GO
