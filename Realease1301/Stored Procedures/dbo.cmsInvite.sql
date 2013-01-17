SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE dbo.cmsInvite 
(
	@CaseID		integer,
	@ActionID	integer = 0,
	@UserID 	integer = 0,
	@InviteByID	integer = 0,
	@LocalID	integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Date	datetime
DECLARE @Exist	integer
DECLARE @Error	integer
SET @Date = GETDATE()
SET @Error = 0

IF ISNULL((SELECT CaseID FROM CASES WHERE CaseID = @CaseID),0) = 0
BEGIN
	SET @Error = 101 -- ERROR: Unknown/invalid case
END

IF @ActionID > 0
BEGIN
	IF ISNULL((SELECT ActionID FROM ACTIONS WHERE CaseID = @CaseID AND ActionID = @ActionID),0) = 0
	BEGIN
		SET @Error = 102 -- ERROR: Unknown/invalid action
	END
END

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @UserID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @InviteByID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF @Error = 0
BEGIN
	IF @ActionID > 0
	BEGIN
		SET @Exist = ISNULL((SELECT TOP 1 UserID FROM CASESXUSERS WHERE CaseID = @CaseID AND ActionID = @ActionID AND UserID = @UserID),0)
	END
	ELSE
	BEGIN
		SET @Exist = ISNULL((SELECT TOP 1 UserID FROM CASESXUSERS WHERE CaseID = @CaseID AND ActionID = 0 AND UserID = @UserID),0)
	END
	IF @Exist = 0
	BEGIN
		INSERT INTO CASESXUSERS (CaseID, ActionID, UserID, InvitedBy, InviteDate)
				VALUES (@CaseID, @ActionID, @UserID, @InviteByID, @Date)
		IF @ActionID = 0
		BEGIN
			UPDATE CASES SET	CASES._CMSDateUpdated = GETDATE()
						WHERE	CASES.CaseID = @CaseID
		END
		ELSE
		BEGIN
			UPDATE ACTIONS SET	ACTIONS._CMSDateUpdated = GETDATE()
						WHERE	ACTIONS.CaseID = @CaseID
						AND		ACTIONS.ActionID = @ActionID

		END
	END
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID

GO
