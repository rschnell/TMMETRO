SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CountCaseFiles' table.
CREATE PROCEDURE [dbo].[_CountCaseFiles_GetAll]
AS
	SELECT * FROM [dbo].[CountCaseFiles]
GO
