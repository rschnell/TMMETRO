SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[cmsNewIssue] 
(
	@CaseID			integer,
	@UserID			integer,
	@Title			varchar(50),
	@Note			nvarchar(MAX) = '',
	@Priority 		integer = 0,
	@LocalID		integer = 0,
	@NewID			integer output,
	@DiaryID		integer output,
	@TypeOf			integer = 0,
	@ActionID		integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Date		datetime
DECLARE @Error		integer
DECLARE @IssueID	integer
DECLARE @StatusOf   integer
DECLARE @InviteID   integer
DECLARE @MgrID      integer

SET @StatusOf = 21
SET @Date = GETDATE()
SET @Error = 0

IF ISNULL((SELECT CaseID FROM CASES WHERE CaseID = @CaseID),0) = 0
BEGIN
	SET @Error = 101 -- ERROR: Unknown/invalid case
END

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @UserID),0) = 0
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
	INSERT INTO ACTIONS (Title, _CMSUsersManagedBy,_CMSUsersAssignedTo, _CMSUsersAssignedBy, _CMSDateRaised, _CMSDateUpdated, _CMSPriorityOf, IsIssue, _CMSStatusOf)
				VALUES (@Title, @UserID, @UserID,@UserID, @Date, @Date, @Priority, 1, @StatusOf)
	SET @IssueID = SCOPE_IDENTITY()
	INSERT INTO DIARY (CaseID, ActionID, IsDescription, Note, NoteHTM, _CMSUsersRaised, _CMSDateUpdated, _CMSTypeOf)
				VALUES (@CaseID, @IssueID, 1, @Note, @Note, @UserId, @Date, @TypeOf)
	SET @DiaryID = SCOPE_IDENTITY()
	SET @NewID = @IssueID
	INSERT INTO CASESXUSERS(CaseID, ActionID, UserId, InvitedBy, InviteDate)
				VALUES (@CaseID, @IssueID, @UserID, @UserID, @Date)
	SET @InviteID = (SELECT _CMSUsersManagedBy FROM CASES WHERE CaseID = @CaseID)
	SET @MgrID = @InviteID
	IF @InviteID <> @UserID
	BEGIN
		INSERT INTO CASESXUSERS(CaseID, ActionID, UserId, InvitedBy, InviteDate)
					VALUES (@CaseID, @IssueID, @InviteID, @UserID, @Date)
	END
	IF @ActionID > 0
	BEGIN
		SET @InviteID = (SELECT _CMSUsersManagedBy FROM ACTIONS WHERE CaseID = @CaseID AND ActionID = @ActionID)
		IF @InviteID <> @UserID AND @InviteID <> @MgrID
		BEGIN
			INSERT INTO CASESXUSERS(CaseID, ActionID, UserId, InvitedBy, InviteDate)
						VALUES (@CaseID, @IssueID, @InviteID, @UserID, @Date)
		END
	END
END
ELSE
BEGIN
	SET @DiaryID = 0
	SET @NewID = 0
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID


GO
