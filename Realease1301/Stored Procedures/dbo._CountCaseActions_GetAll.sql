SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountCaseActions' table.
CREATE PROCEDURE [dbo].[_CountCaseActions_GetAll]
AS
	SELECT * FROM [dbo].[CountCaseActions]
GO
