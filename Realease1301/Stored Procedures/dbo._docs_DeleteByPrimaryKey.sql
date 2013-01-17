SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'docs' table using the primary key value.
CREATE PROCEDURE [dbo].[_docs_DeleteByPrimaryKey]
	@DocID int
AS
	DELETE FROM [dbo].[docs] WHERE
		[docID] = @DocID
GO
