SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CASESXTREES' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESXTREES_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CASESXTREES] WHERE
		[ID] = @ID
GO
