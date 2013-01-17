SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'USERSPASSWORDS' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERSPASSWORDS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[USERSPASSWORDS] WHERE
		[ID] = @ID
GO
