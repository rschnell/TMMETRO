SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[cmsAttachment] 
(
	@DiaryID		integer,
	@Title		 	nvarchar(50),
	@FilePath		nvarchar(255),
	@FileName		nvarchar(255),
	@FileGUID		varchar(50),
	@UserID			integer,
	@ContentType	varchar(255),
	@FileSize		integer = 0,
	@Type           integer=0, 
	@LocalID		integer = 0,
	@NewID			integer output
)
AS

SET NOCOUNT ON

DECLARE @Date			datetime
DECLARE @Error			integer
DECLARE @CaseID			integer
DECLARE @ActionID		integer
DECLARE @Version		integer
DECLARE @SubscriptionID	integer
SET @Date = GETDATE()
SET @Error = 0

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @UserID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF ISNULL((SELECT DiaryID FROM DIARY WHERE DiaryID = @DiaryID),0) = 0
BEGIN
	SET @Error = 112 -- ERROR: Unknown/invalid diary
END

IF LEN(@Title) = 0
BEGIN
	SET @Error = 113 -- ERROR: Title required
END

IF LEN(@FilePath) = 0
BEGIN
	SET @Error = 114 -- ERROR: Path required
END

IF LEN(@FileName) = 0
BEGIN
	SET @Error = 115 -- ERROR: FileName required
END

IF LEN(@FileGUID) = 0
BEGIN
	SET @Error = 115 -- ERROR: FileName required
END

IF @Error = 0
BEGIN
	SELECT @CaseID=CaseID, @ActionID=ActionID FROM DIARY WHERE DiaryID = @DiaryID
	--
	SET @SubscriptionID = (SELECT USERS.SubscriptionID FROM CASES
										INNER JOIN USERS ON USERS.UserID = CASES._CMSUSERSManagedBy
										WHERE CASES.CaseID = @CaseID)
	SELECT CASES.CaseID
	INTO #tmpCases
	FROM CASES
		INNER JOIN USERS ON USERS.UserID = CASES._CMSUSERSManagedBy
		WHERE USERS.SubscriptionID = @SubscriptionID
	SELECT DIARY.DiaryID
	INTO #tmpDiary
	FROM DIARY
		INNER JOIN #tmpCases TC ON TC.CaseID = DIARY.CaseID
	SET @Version = (SELECT COUNT(FileName) FROM ATTACHMENTS WHERE FileName = @FileName AND DiaryID IN (SELECT DiaryID FROM #tmpDiary)) + 1
	--
	INSERT INTO ATTACHMENTS	(DiaryID, Title, FilePath, FileName, FileGUID, FileVersion, FileSize, ContentType, _CMSUsersRaisedBy,[Type], Active)
				VALUES	(@DiaryID, @Title, @FilePath, @FileName, @FileGUID, @Version, @FileSize, @ContentType, @UserID,@Type, 1)
	SET @NewID = SCOPE_IDENTITY()
	IF @ActionID = 0
	BEGIN
		UPDATE CASES SET	CASES._CMSUsersUpdated = @UserID,
							CASES._CMSDateUpdated = @Date
					WHERE	CASES.CaseID = @CaseID
	END
	ELSE
	BEGIN
		UPDATE ACTIONS SET	ACTIONS._CMSUsersUpdated = @UserID,
							ACTIONS._CMSDateUpdated = @Date
					WHERE	ACTIONS.CaseID = @CaseID
					AND		ACTIONS.ActionID = @ActionID

	END
END
ELSE
BEGIN
	SET @NewID = 0
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID


GO
