SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'CASESXUSERS' table.
CREATE PROCEDURE [dbo].[_CASESXUSERS_Update]
	-- The rest of writeable parameters
	@CASEID int,
	@ACTIONID int,
	@USERID int,
	@INVITEDATE datetime,
	@INVITEDBY int,
	@NOINVITE bit,
	@NOCHANGE int,
	@NOASSIGNEE int,
	@NOASSIGN int,
	@INVISIBLE int,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[CASESXUSERS] SET
		[CASEID] = @CASEID,
		[ACTIONID] = @ACTIONID,
		[USERID] = @USERID,
		[INVITEDATE] = @INVITEDATE,
		[INVITEDBY] = @INVITEDBY,
		[NOINVITE] = @NOINVITE,
		[NOCHANGE] = @NOCHANGE,
		[NOASSIGNEE] = @NOASSIGNEE,
		[NOASSIGN] = @NOASSIGN,
		[INVISIBLE] = @INVISIBLE
	WHERE
		[ID] = @ID
GO
