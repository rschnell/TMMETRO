SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'AllTemplates' table.
CREATE PROCEDURE [dbo].[_AllTemplates_GetAll]
AS
	SELECT * FROM [dbo].[AllTemplates]
GO
