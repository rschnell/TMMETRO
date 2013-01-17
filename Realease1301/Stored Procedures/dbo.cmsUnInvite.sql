SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[cmsUnInvite]
(
	@CaseID		integer,
	@ActionID	integer = 0,
	@UserID 	integer = 0,
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

IF @Error = 0
BEGIN
	IF @ActionID > 0
	BEGIN
		DELETE CASESXUSERS
					WHERE CaseID = @CaseID 
					AND ActionID = @ActionID 
					AND UserID = @UserID
		UPDATE ACTIONS SET	ACTIONS._CMSDateUpdated = GETDATE()
					WHERE	ACTIONS.CaseID = @CaseID
					AND		ACTIONS.ActionID = @ActionID
	END
	ELSE
	BEGIN
		DELETE CASESXUSERS 
					WHERE CaseID = @CaseID 
					AND  @ActionID=0
					AND UserID = @UserID
		UPDATE CASES SET	CASES._CMSDateUpdated = GETDATE()
					WHERE	CASES.CaseID = @CaseID
	END
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID


GO
