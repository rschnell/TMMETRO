SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'Configuration' table using the primary key value.
CREATE PROCEDURE [dbo].[_Configuration_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[Configuration] WHERE
		[ID] = @ID
GO
