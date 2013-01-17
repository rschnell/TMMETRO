SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'docs' table using the primary key value.
CREATE PROCEDURE [dbo].[_docs_GetByPrimaryKey]
	@DocID int
AS
	SELECT * FROM [dbo].[docs] WHERE
		[docID] = @DocID
GO
