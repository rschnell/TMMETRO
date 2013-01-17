SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[cmsUpdateTitleNote] 
(
	@CaseID 	integer = 0,
	@ActionID	integer = 0,
	@UserID		integer = 0,
	@Title		nvarchar(100) = '',
	@Note		nvarchar(MAX) = '',
	@NoteHTM	nvarchar(MAX) = '',
	@LocalID	integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Date		datetime
DECLARE @Error		integer
DECLARE @DiaryID	integer
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

SET @DiaryID = ISNULL((SELECT DiaryID FROM DIARY WHERE CaseID = @CaseID AND ActionID = @ActionID AND IsDescription = 1),0)

IF @DiaryID = 0
BEGIN
	SET @Error = 117 -- ERROR: Unknown/invalid diary
END

IF @Error = 0
BEGIN
	UPDATE DIARY SET		DIARY._CMSUSERSRaised = @UserID,
							DIARY._CMSDateUpdated = @Date,
							DIARY.Note = @Note,
							DIARY.NoteHTM = @NoteHTM
					WHERE	DIARY.DiaryID = @DiaryID
	IF @ActionID = 0
	BEGIN
		UPDATE CASES SET	CASES.Title = @Title,
							CASES._CMSUsersUpdated = @UserID,
							CASES._CMSDateUpdated = @Date
					WHERE	CASES.CaseID = @CaseID
	END
	ELSE
	BEGIN
		UPDATE ACTIONS SET	ACTIONS.Title = @Title,
							ACTIONS._CMSUsersUpdated = @UserID,
							ACTIONS._CMSDateUpdated = @Date
					WHERE	ACTIONS.CaseID = @CaseID
					AND		ACTIONS.ActionID = @ActionID
	END
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID

GO
