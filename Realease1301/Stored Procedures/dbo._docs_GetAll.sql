SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'docs' table.
CREATE PROCEDURE [dbo].[_docs_GetAll]
AS
	SELECT * FROM [dbo].[docs]
GO
