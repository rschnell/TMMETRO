SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'USERSPASSWORDS' table.
CREATE PROCEDURE [dbo].[_USERSPASSWORDS_Update]
	-- The rest of writeable parameters
	@USERID int,
	@PASSWORD nvarchar(50),
	@SETDATE datetime,
	@ATTEMPTS int,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[USERSPASSWORDS] SET
		[USERID] = @USERID,
		[PASSWORD] = @PASSWORD,
		[SETDATE] = @SETDATE,
		[ATTEMPTS] = @ATTEMPTS
	WHERE
		[ID] = @ID
GO
