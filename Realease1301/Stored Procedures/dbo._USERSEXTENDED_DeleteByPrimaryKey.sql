SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'USERSEXTENDED' table using the primary key value.
CREATE PROCEDURE [dbo].[_USERSEXTENDED_DeleteByPrimaryKey]
	@USERID int
AS
	DELETE FROM [dbo].[USERSEXTENDED] WHERE
		[USERID] = @USERID
GO
