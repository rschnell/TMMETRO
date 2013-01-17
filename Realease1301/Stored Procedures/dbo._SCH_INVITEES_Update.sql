SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'SCH_INVITEES' table.
CREATE PROCEDURE [dbo].[_SCH_INVITEES_Update]
	-- The rest of writeable parameters
	@USERID int,
	@EVENTID int,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[SCH_INVITEES] SET
		[USERID] = @USERID,
		[EVENTID] = @EVENTID
	WHERE
		[ID] = @ID
GO
