SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountIssueFiles' table.
CREATE PROCEDURE [dbo].[_CountIssueFiles_GetAll]
AS
	SELECT * FROM [dbo].[CountIssueFiles]
GO
