SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'USERSPASSWORDS' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERSPASSWORDS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[USERSPASSWORDS] WHERE
		[ID] = @ID
GO
