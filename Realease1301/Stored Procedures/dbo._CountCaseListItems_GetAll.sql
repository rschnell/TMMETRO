SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountCaseListItems' table.
CREATE PROCEDURE [dbo].[_CountCaseListItems_GetAll]
AS
	SELECT * FROM [dbo].[CountCaseListItems]
GO
