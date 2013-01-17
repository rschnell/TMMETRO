SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'AllCategories' table.
CREATE PROCEDURE [dbo].[_AllCategories_GetAll]
AS
	SELECT * FROM [dbo].[AllCategories]
GO
