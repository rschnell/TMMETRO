SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[cmsNewCase] 
(
	@UserID			integer,
	@Title			varchar(50),
	@Note			nvarchar(MAX) = '',
	@Priority 		integer = 12,
	@LocalID		integer = 0,
	@NewID			integer output,
	@DiaryID		integer output,
	@TypeOf			integer = 4,
	@SubscriptionID integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Date		datetime
DECLARE @Error		integer
DECLARE @CaseID		integer
DECLARE @StatusOf	integer
DECLARE @GroupID	integer
DECLARE @SubMgrID	integer
DECLARE @Project    integer 
Declare @RiskOf     integer
Declare @ImpactOf   integer

SET @StatusOf = 21
SET @Date = GETDATE()
SET @Error = 0
Set @Project=100000001
SET @ImpactOf=52
SET @RiskOf=42

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

If @SubscriptionId = 0
BEGIN 
	SET @Error = 120 -- ERROR: A subscription is mandatory
END


IF @Error = 0
BEGIN
	SET @GroupID = (SELECT GroupID FROM USERS WHERE UserID = @UserID)
	SET @SubMgrID = (SELECT TOP 1 UserID FROM SUBSXUSERS WHERE SubscriptionID = @SubscriptionID AND IsSubManager = 1)
	INSERT INTO CASES (Title, _CMSUSERSManagedBy, _CMSUSERSAssignedTo,_CMSUSERSAssignedBy, _CMSUsersRaisedBy, _CMSUsersUpdated, _CMSDateRaised, _CMSDateOccured, _CMSDateUpdated, _CMSPriorityOf, _CMSStatusOf, Active, SubscriptionID, GroupID,ActionID,IsUnManaged,_CMSProjectContains,IsSticky,IsIssue,REFERENCE,REPORTEDBY,_CMSRISKof,_CMSIMPACTof,_CMSDateEnd,_CMSDateEndAgreed)
				VALUES (@Title, @SubMgrID,@SubMgrID, @UserID, @UserID,@Userid, @Date, @Date, @Date, @Priority, @StatusOf, 1, @SubscriptionID, @GroupID,0,0,@Project,0,0,'NA','NA',@RiskOf,@ImpactOf,@Date,@Date)
	SET @CaseID = SCOPE_IDENTITY()
	INSERT INTO DIARY (CaseID, ActionID, IsDescription, Note, NoteHTM, _CMSUsersRaised, _CMSDateUpdated, _CMSTypeOf,Active)
				VALUES (@CaseID, 0, 1, @Note, @Note, @UserID, @Date, @TypeOf,1)
	SET @DiaryID = SCOPE_IDENTITY()
	SET @NewID = @CaseID
	INSERT INTO CASESXUSERS (CaseID, ActionID, UserID, InviteDate, InvitedBy)
				VALUES (@CaseID, 0, @SubMgrID, @Date, @UserID)
END
ELSE
BEGIN
	SET @DiaryID = 0
	SET @NewID = 0
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID



GO
