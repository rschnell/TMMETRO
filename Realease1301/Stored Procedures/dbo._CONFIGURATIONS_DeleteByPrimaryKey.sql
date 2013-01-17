SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'CONFIGURATIONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CONFIGURATIONS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CONFIGURATIONS] WHERE
		[ID] = @ID
GO
