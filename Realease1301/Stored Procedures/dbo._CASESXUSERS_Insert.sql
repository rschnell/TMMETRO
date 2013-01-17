SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'CASESXUSERS' table.
CREATE PROCEDURE [dbo].[_CASESXUSERS_Insert]
	@CASEID int,
	@ACTIONID int,
	@USERID int,
	@INVITEDATE datetime,
	@INVITEDBY int,
	@NOINVITE bit,
	@NOCHANGE int,
	@NOASSIGNEE int,
	@NOASSIGN int,
	@INVISIBLE int
AS
	INSERT INTO [dbo].[CASESXUSERS]
	(
		[CASEID],
		[ACTIONID],
		[USERID],
		[INVITEDATE],
		[INVITEDBY],
		[NOINVITE],
		[NOCHANGE],
		[NOASSIGNEE],
		[NOASSIGN],
		[INVISIBLE]
	)
	VALUES
	(
		@CASEID,
		@ACTIONID,
		@USERID,
		@INVITEDATE,
		@INVITEDBY,
		@NOINVITE,
		@NOCHANGE,
		@NOASSIGNEE,
		@NOASSIGN,
		@INVISIBLE
	)
	SELECT @@IDENTITY
GO