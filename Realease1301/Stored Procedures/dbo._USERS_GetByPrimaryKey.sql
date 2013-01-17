SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'USERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[USERS] WHERE
		[ID] = @ID
GO
