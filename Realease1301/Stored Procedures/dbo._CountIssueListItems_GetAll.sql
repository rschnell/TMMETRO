SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountIssueListItems' table.
CREATE PROCEDURE [dbo].[_CountIssueListItems_GetAll]
AS
	SELECT * FROM [dbo].[CountIssueListItems]
GO
