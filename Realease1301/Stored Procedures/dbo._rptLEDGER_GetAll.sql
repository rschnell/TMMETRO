SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptLEDGER' table.
CREATE PROCEDURE [dbo].[_rptLEDGER_GetAll]
AS
	SELECT * FROM [dbo].[rptLEDGER]
GO
