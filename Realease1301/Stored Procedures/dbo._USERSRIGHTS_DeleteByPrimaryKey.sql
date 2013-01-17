SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'USERSRIGHTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERSRIGHTS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[USERSRIGHTS] WHERE
		[ID] = @ID
GO
