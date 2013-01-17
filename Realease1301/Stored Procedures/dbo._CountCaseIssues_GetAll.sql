SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountCaseIssues' table.
CREATE PROCEDURE [dbo].[_CountCaseIssues_GetAll]
AS
	SELECT * FROM [dbo].[CountCaseIssues]
GO
