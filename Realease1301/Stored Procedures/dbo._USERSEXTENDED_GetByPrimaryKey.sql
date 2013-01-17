SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'USERSEXTENDED' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERSEXTENDED_GetByPrimaryKey]
	@USERID int
AS
	SELECT * FROM [dbo].[USERSEXTENDED] WHERE
		[USERID] = @USERID
GO
