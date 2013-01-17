SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'USERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[USERS] WHERE
		[ID] = @ID
GO
