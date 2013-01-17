SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[cmsClose] 
(
	@CaseID		integer,
	@ActionID	integer = 0,
	@UserID 	integer = 0,
	@Resolution integer = 0,
	@Status 	nchar(50) = '',
	@LocalID	integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Date		datetime
DECLARE @Error		integer
DECLARE @MgrID		integer
DECLARE @StatusOf	integer
DECLARE @SubID		integer
DECLARE @Boss		integer

SET @Date = GETDATE()
SET @Error = 0
SET @StatusOf = 22
SET @SubID = (SELECT TOP 1 SubscriptionID FROM CASES WHERE CaseID = @CaseID)
SET @Boss = (SELECT TOP 1 UserID FROM SUBSXUSERS WHERE SubscriptionID = @SubID AND IsSubManager = 1)

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

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @UserID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF @Error = 0 AND @Boss <> @UserID
BEGIN
	IF @ActionID = 0
	BEGIN
		SET @MgrID = (SELECT _CMSUsersManagedBy FROM CASES WHERE CaseID = @CaseID)
		IF @MgrID <> @UserID
		BEGIN
			SET @Error = 110 -- ERROR: Cannot close case. User not case manager
		END
	END
	ELSE
	BEGIN
		SET @MgrID = (SELECT _CMSUsersManagedBy FROM ACTIONS WHERE CaseID = @CaseID AND ActionID = @ActionID)
		IF @MgrID <> @UserID
		BEGIN
			SET @Error = 111 -- ERROR: Cannot close action. User not action initiator
		END
	END
END

IF @Error = 0
BEGIN
	IF @ActionID = 0
	BEGIN
		UPDATE CASES SET	CASES._CMSStatusOf = @StatusOf,
							CASES.Status = @Status,
							CASES._CMSDateUpdated = @Date,
							CASES._CMSDATEClosed = @Date,
							CASES._CMSRESOLUTIONSOf = @Resolution
					WHERE	CASES.CaseID = @CaseID
	END
	ELSE
	BEGIN
		UPDATE ACTIONS SET	ACTIONS._CMSStatusOf = @StatusOf,
							ACTIONS.Status = @Status,
							ACTIONS._CMSDateUpdated = @Date,
							ACTIONS._CMSDATEClosed = @Date,
							ACTIONS._CMSRESOLUTIONSOf = @Resolution
					WHERE	ACTIONS.CaseID = @CaseID
					AND		ACTIONS.ActionID = @ActionID

	END
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID

GO
