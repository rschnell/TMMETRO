SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[cmsNewAction] 
(
	@CaseID			integer,
	@MgrUserID		integer,
	@InvUserID		integer,
	@Title			varchar(50),
	@Note			nvarchar(MAX) = '',
	@Priority 		integer = 0,
	@DeadlineDate 	varchar(25) = '',
	@LocalID		integer = 0,
	@NewID			integer output,
	@DiaryID		integer output,
	@TypeOf			integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Deadline	datetime
DECLARE @Date		datetime
DECLARE @Error		integer
DECLARE @ActionID	integer
DECLARE @StatusOf   integer
DECLARE @Risk		integer
DECLARE @Impact     integer 

SET @Date = GETDATE()
SET @Error = 0
SET @StatusOf = 21
SET @Risk = 42
SET @Impact = 52


IF ISNULL((SELECT CaseID FROM CASES WHERE CaseID = @CaseID),0) = 0
BEGIN
	SET @Error = 101 -- ERROR: Unknown/invalid case
END

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @MgrUserID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @InvUserID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF LEN(@Title) = 0
BEGIN
	SET @Error = 113 -- ERROR: Title required
END

IF LEN(@Note) = 0
BEGIN
	SET @Error = 116 -- ERROR: Note required
END

IF @Error = 0
BEGIN
	IF LEN(@DeadlineDate) > 0
	BEGIN
		IF ISDATE(@DeadlineDate) = 0
		BEGIN
			SET @Error = 108 -- ERROR: Invalid date
		END
		IF @Error = 0
		BEGIN
			SET @Deadline = CAST(@DeadlineDate AS datetime)
		END
	END
	ELSE
	BEGIN
		SET @Deadline = @Date
	END
	--
	IF @Date > @Deadline
	BEGIN
		SET @Error = 109 -- ERROR: Deadline cannot be before today
	END
END

IF @Error = 0
BEGIN
	INSERT INTO ACTIONS (CaseId,Title, _CMSUsersManagedBy,_CMSUsersAssignedTo, _CMSUsersAssignedBy, _CMSDateRaised, _CMSDateEnd,_CMSDATEENDAGREED, _CMSDateUpdated, _CMSPriorityOf,_CMSRiskOf, IsIssue, Active, _CMSStatusOf,_CMSImpactOf)
				VALUES (@CaseId, @Title, @MgrUserID,@MgrUserID, @InvUserID, @Date, @Deadline,@Deadline, @Date, @Priority, @Risk, 0, 1, @StatusOf,@Impact)
	SET @ActionID = SCOPE_IDENTITY()
	INSERT INTO DIARY (CaseID, ActionID, IsDescription, Note,Notehtm, _CMSUsersRaised, _CMSDateUpdated, _CMSTypeOf)
				VALUES (@CaseID, @ActionID, 1, @Note, @Note, @InvUserId, @Date, @TypeOf)
	SET @DiaryID = SCOPE_IDENTITY()
	SET @NewID = @ActionID
	INSERT INTO CASESXUSERS(CaseID, ActionID, UserId, InvitedBy, InviteDate)
				VALUES (@CaseID, @ActionId, @MgrUserId, @MgrUserID, @Date)
	IF @MgrUserId <> @InvUserId -- Invite the inititor into the action as well
	BEGIN
		INSERT INTO CASESXUSERS(CaseID, ActionID, UserId, InvitedBy, InviteDate)
					VALUES (@CaseID, @ActionId, @InvUserId, @InvUserID, @Date)
	END
END
ELSE
BEGIN
	SET @DiaryID = 0
	SET @NewID = 0
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID


GO
