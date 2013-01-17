SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'docs' table.
CREATE PROCEDURE [dbo].[_docs_DeleteAll]
AS
	DELETE FROM [dbo].[docs]
GO
