SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'COUNTCASEENVITES' table.
CREATE PROCEDURE [dbo].[_COUNTCASEENVITES_GetAll]
AS
	SELECT * FROM [dbo].[COUNTCASEENVITES]
GO
