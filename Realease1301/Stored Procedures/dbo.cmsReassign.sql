SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE dbo.cmsReassign 
(
	@CaseID		integer,
	@ActionID	integer = 0,
	@MgrUserID	integer,
	@AsnByUserID integer,
	@AsnToUserID	integer,
	@LocalID	integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Date	datetime
DECLARE @Error	integer
SET @Date = GETDATE()
SET @Error = 0

IF ISNULL((SELECT CaseID FROM CASES WHERE CaseID = @CaseID),0) = 0
BEGIN
	SET @Error = 101 -- ERROR: Unknown/invalid case
END

IF @ActionID <> 0
BEGIN
	IF ISNULL((SELECT ActionID FROM ACTIONS WHERE CaseID = @CaseID AND ActionID = @ActionID),0) = 0
	BEGIN
		SET @Error = 102 -- ERROR: Unknown/invalid action
	END
END

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @MgrUserID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @AsnToUserID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @AsnByUserID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF @Error = 0
BEGIN
	IF @ActionID = 0
	BEGIN
		UPDATE CASES SET	CASES._CMSUsersManagedBy = @MgrUserID,
		                    CASES._CMSUsersAssignedTo = @AsnToUserID,
							CASES._CMSUsersAssignedBy = @AsnByUserID,
							CASES._CMSDateUpdated = @Date
					WHERE	CASES.CaseID = @CaseID
	END
	ELSE
	BEGIN
		UPDATE ACTIONS SET	ACTIONS._CMSUsersManagedBy = @MgrUserID,
		                    ACTIONS._CMSUsersAssignedTo = @AsnToUserID,
							ACTIONS._CMSUsersAssignedBy = @AsnByUserID,
							ACTIONS._CMSDateUpdated = @Date
					WHERE	ACTIONS.CaseID = @CaseID
					AND		ACTIONS.ActionID = @ActionID

	END
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID

GO
