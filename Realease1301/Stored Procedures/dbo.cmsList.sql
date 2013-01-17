SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE  PROCEDURE [dbo].[cmsList] 
(
	@CaseID		integer = 0,
	@ActionID	integer = 0,
	@DiaryID	integer = 0,
	@Command	char(1) = '?'
)
AS

SET NOCOUNT ON
DECLARE @Count			integer
DECLARE @RowID			integer
DECLARE @FileName		varchar(255)
DECLARE @FilePath		varchar(255)
DECLARE @TreeID 		varchar(255)
DECLARE @NodeName		varchar(255)
DECLARE @Title			varchar(255)
DECLARE @Message		varchar(MAX)
DECLARE @TimeNow		datetime
DECLARE @DeadlineDate	datetime
DECLARE @DeadlineDays	integer

SET @TimeNow = GETDATE()

CREATE TABLE #tmpList (List varchar(1000), Extra varchar(8000))

IF @Command = '?'
BEGIN
	INSERT INTO #tmpList (List) VALUES ('Command [list] help. LIST [USER|DEADLINE|PRIORITY|RESOLUTION|ACTION|ISSUE|ATTACH]')
END
IF @Command = 'U'
BEGIN
	SET @Count = 0
	DECLARE curList CURSOR FOR SELECT UserID, Username FROM cmsListUserGroup(@CaseID) ORDER BY Username ASC
	--DECLARE curList CURSOR FOR SELECT TreeID, NodeName FROM listUSERS ORDER BY TreeID
	OPEN curList
	INSERT INTO #tmpList (List) VALUES ('Command [list users]')
	FETCH NEXT FROM curList INTO @TreeID, @NodeName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Count = @Count + 1
		INSERT INTO #tmpList (List) VALUES (CAST(@Count AS varchar(10)) + '. ' + @NodeName)
		FETCH NEXT FROM curList INTO @TreeID, @NodeName
	END
	CLOSE curList
	DEALLOCATE curList
END
IF @Command = 'D'
BEGIN
	SET @Count = 0
	DECLARE curDeadline CURSOR FOR
		SELECT ISNULL(CASES._CMSDateEnd,DATEADD(Day,-365,@TimeNow)) AS OverDue,
			   ISNULL(CASES.Title,'Case:' + CAST(CaseID AS varchar(10))),
			   '1' AS SortOrder
		FROM   CASES
		WHERE  CaseID = @CaseID
		AND    @ActionID = 0
		UNION
		SELECT ISNULL(ACTIONS._CMSDateEnd,DATEADD(Day,-365,@TimeNow)),
			   ISNULL(ACTIONS.Title,'Action:' + CAST(ActionID AS varchar(10))),
			   '2' AS SortOrder
		FROM   ACTIONS
		WHERE  CaseID = @CaseID
		AND    ActionID = @ActionID
		AND    @ActionID > 0
		UNION
		SELECT ISNULL(ACTIONS._CMSDateEnd,DATEADD(Day,-365,@TimeNow)),
			   ISNULL(ACTIONS.Title,'Action:' + CAST(ActionID AS varchar(10))),
			   '2' AS SortOrder
		FROM   ACTIONS
		WHERE  CaseID = @CaseID
		AND    @ActionID = 0
		ORDER BY SortOrder,
				 OverDue
		FOR READ ONLY
	SET @Message = 'Command [list deadline]' + CHAR(10)
	INSERT INTO #tmpList (List) VALUES (@Message)
	SET @Count = 0
	OPEN curDeadline
	FETCH NEXT FROM curDeadline INTO @DeadlineDate, @Title, @RowID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @ActionID = 0
		BEGIN
			SET @Count = @Count + 1
			SET @Message = CAST(@Count AS varchar(10)) + '. '
		END
		ELSE
		BEGIN
			SET @Message = ''
		END
		SET @Message = @Message 
					+ LTRIM(RTRIM(@Title)) + SPACE(1)
		SET @DeadlineDays = DATEDIFF(Day,@TimeNow,@DeadlineDate)
		SET @Message = @Message 
					+ CAST(ABS(@DeadlineDays) AS varchar(10))
					+ ' days' 
		IF @DeadlineDays < 0
		BEGIN
			SET @Message = @Message 
						+ ' overdue,' 
		END
		SET @Message = @Message 
					+ ' due '
					+ CONVERT(varchar(50), @DeadlineDate, 111)
					+ CHAR(10)
		INSERT INTO #tmpList (List) VALUES (@Message)
		FETCH NEXT FROM curDeadline INTO @DeadlineDate, @Title, @RowID
	END
	CLOSE curDeadline
	DEALLOCATE curDeadline
END
IF @Command = 'P'
BEGIN
	SET @Count = 0
	DECLARE curList CURSOR FOR SELECT TreeID, NodeName FROM listPRIORITY ORDER BY TreeID
	OPEN curList
	INSERT INTO #tmpList (List) VALUES ('Command [list priorities]')
	FETCH NEXT FROM curList INTO @TreeID, @NodeName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Count = @Count + 1
		INSERT INTO #tmpList (List) VALUES (CAST(@Count AS varchar(10)) + '. ' + @NodeName)
		FETCH NEXT FROM curList INTO @TreeID, @NodeName
	END
	CLOSE curList
	DEALLOCATE curList
END
IF @Command = 'R'
BEGIN
	SET @Count = 0
	DECLARE curList CURSOR FOR SELECT TreeID, NodeName FROM listRESOLUTION ORDER BY TreeID
	OPEN curList
	INSERT INTO #tmpList (List) VALUES ('Command [list resolutions]')
	FETCH NEXT FROM curList INTO @TreeID, @NodeName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Count = @Count + 1
		INSERT INTO #tmpList (List) VALUES (CAST(@Count AS varchar(10)) + '. ' + @NodeName)
		FETCH NEXT FROM curList INTO @TreeID, @NodeName
	END
	CLOSE curList
	DEALLOCATE curList
END
IF @Command = 'S'
BEGIN
	SET @Count = 0
	DECLARE curList CURSOR FOR SELECT TreeID, NodeName FROM listSTATUS ORDER BY TreeID
	OPEN curList
	INSERT INTO #tmpList (List) VALUES ('Command [list status]')
	FETCH NEXT FROM curList INTO @TreeID, @NodeName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Count = @Count + 1
		INSERT INTO #tmpList (List) VALUES (CAST(@Count AS varchar(10)) + '. ' + @NodeName)
		FETCH NEXT FROM curList INTO @TreeID, @NodeName
	END
	CLOSE curList
	DEALLOCATE curList
END
IF @Command = 'A'
BEGIN
	SET @Count = 0
	DECLARE curActions CURSOR FOR
		SELECT	ACTIONS.Title
		FROM	ACTIONS
		WHERE	ACTIONS.CaseID = @CaseID
		AND		ACTIONS.IsIssue = 0
		ORDER BY ACTIONS.ActionID
	OPEN curActions
	INSERT INTO #tmpList (List) VALUES ('Command [list actions]')
	FETCH NEXT FROM curActions INTO @Title
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Count = @Count + 1
		INSERT INTO #tmpList (List) VALUES (CAST(@Count AS varchar(10)) + '. ' + @Title)
		FETCH NEXT FROM curActions INTO @Title
	END
	CLOSE curActions
	DEALLOCATE curActions
END
IF @Command = 'I'
BEGIN
	SET @Count = 0
	DECLARE curIssues CURSOR FOR
		SELECT	ACTIONS.Title
		FROM	ACTIONS
		WHERE	ACTIONS.CaseID = @CaseID
		AND		ACTIONS.IsIssue = 1
		ORDER BY ACTIONS.ActionID
	OPEN curIssues
	INSERT INTO #tmpList (List) VALUES ('Command [list issues]')
	FETCH NEXT FROM curIssues INTO @Title
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Count = @Count + 1
		INSERT INTO #tmpList (List) VALUES (CAST(@Count AS varchar(10)) + '. ' + @Title)
		FETCH NEXT FROM curIssues INTO @Title
	END
	CLOSE curIssues
	DEALLOCATE curIssues
END
IF @Command = 'T'
BEGIN
	SET @Count = 0
	CREATE TABLE #tmpAttach (FileName varchar(255), FilePath varchar(255), AttachID integer)
	INSERT INTO #tmpAttach (FileName, FilePath, AttachID)
			SELECT	ATTACHMENTS.FileName,
					ATTACHMENTS.FilePath,
					ATTACHMENTS.AttachmentID
			FROM	ATTACHMENTS
			WHERE	ATTACHMENTS.DiaryID = @DiaryID
	INSERT INTO #tmpAttach (FileName, FilePath, AttachID)
			SELECT	ATTACHMENTS.FileName,
					ATTACHMENTS.FilePath,
					ATTACHMENTS.AttachmentID
			FROM	ATTACHMENTS
			INNER JOIN DIARY ON DIARY.DiaryID = ATTACHMENTS.DiaryID
			WHERE	DIARY.CaseID = @CaseID
			AND		@ActionID = 0
	INSERT INTO #tmpAttach (FileName, FilePath, AttachID)
			SELECT	ATTACHMENTS.FileName,
					ATTACHMENTS.FilePath,
					ATTACHMENTS.AttachmentID
			FROM	ATTACHMENTS
			INNER JOIN DIARY ON DIARY.DiaryID = ATTACHMENTS.DiaryID
			WHERE	DIARY.CaseID = @CaseID
			AND		DIARY.ActionID = @ActionID
			AND		@ActionID > 0
	DECLARE curAttach CURSOR FOR
		SELECT DISTINCT	FileName, FilePath, AttachID
		FROM #tmpAttach
		ORDER BY AttachID
		FOR READ ONLY
	OPEN curAttach
	INSERT INTO #tmpList (List) VALUES ('Command [list attachments]')
	FETCH NEXT FROM curAttach INTO @FileName, @FilePath, @RowID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Count = @Count + 1
		INSERT INTO #tmpList (List, Extra) VALUES (CAST(@Count AS varchar(10)) + '. ' + @FileName, @FilePath)
		FETCH NEXT FROM curAttach INTO @FileName, @FilePath, @RowID
	END
	CLOSE curAttach
	DEALLOCATE curAttach
	DROP TABLE #tmpAttach
END

SELECT List, Extra FROM #tmpList
DROP TABLE #tmpList

GO
