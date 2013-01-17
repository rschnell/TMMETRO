SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'USERSRIGHTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERSRIGHTS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[USERSRIGHTS] WHERE
		[ID] = @ID
GO
