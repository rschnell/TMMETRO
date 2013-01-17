SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'TEMPLATESBASE' table using the primary key value.
CREATE PROCEDURE [dbo].[_TEMPLATESBASE_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[TEMPLATESBASE] WHERE
		[ID] = @ID
GO
