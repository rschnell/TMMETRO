SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'TEMPLATES' table using the primary key value.
CREATE PROCEDURE [dbo].[_TEMPLATES_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[TEMPLATES] WHERE
		[ID] = @ID
GO
