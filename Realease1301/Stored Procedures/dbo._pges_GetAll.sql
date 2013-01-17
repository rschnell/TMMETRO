SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'pges' table.
CREATE PROCEDURE [dbo].[_pges_GetAll]
AS
	SELECT * FROM [dbo].[pges]
GO
