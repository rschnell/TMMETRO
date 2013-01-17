SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[cmsContribute] 
(
	@CaseID		integer,
	@ActionID	integer = 0,
	@UserID 	integer = 0,
	@Note		nvarchar(MAX) = '',
	@NoteHTM	nvarchar(MAX) = '',
	@LocalID	integer = 0,
	@DiaryID	integer  OUTPUT,
	@TypeOf		integer = 0,
    @ChangeType nvarchar(10)='',
    @OldValue nvarchar(10)='',
    @NewValue nvarchar(10)=''
)
AS

SET NOCOUNT ON

DECLARE @Date	datetime
DECLARE @Error	integer

SET @Date = GETDATE()
SET @Error = 0



IF @CaseID<>0
BEGIN
IF ISNULL((SELECT CaseID FROM CASES WHERE CaseID = @CaseID),0) = 0
	BEGIN
		SET @Error = 101 -- ERROR: Unknown/invalid case
	END
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

IF @Error = 0
BEGIN
	INSERT INTO DIARY	(CaseID, ActionID, _CMSUsersRaised, _CMSDateUpdated, Note, NoteHTM, _CMSTypeOf, IsDescription, ChangeType,OldValue,NewValue,ACTIVE)
				VALUES	(@CaseID, @ActionID, @UserID, @Date, @Note, @NoteHTM, @TypeOf, 0,@Changetype,@OldValue,@NewValue,1)
	SET @DiaryID = SCOPE_IDENTITY()
	IF @CASEID <>0 
	BEGIN
		IF @ActionID = 0
		BEGIN
			UPDATE CASES SET	CASES._CMSDateUpdated = @Date,
								CASES._CMSUSERSUpdated = @UserId
						WHERE	CASES.CaseID = @CaseID
		END
		ELSE
		BEGIN
			UPDATE ACTIONS SET	ACTIONS._CMSDateUpdated = @Date,
								ACTIONS._CMSUSERSUpdated = @UserId
						WHERE	ACTIONS.CaseID = @CaseID
						AND		ACTIONS.ActionID = @ActionID

		END
	END
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID


GO
