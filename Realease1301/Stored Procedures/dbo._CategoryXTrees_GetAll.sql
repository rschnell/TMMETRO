SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'CategoryXTrees' table.
CREATE PROCEDURE [dbo].[_CategoryXTrees_GetAll]
AS
	SELECT * FROM [dbo].[CategoryXTrees]
GO
