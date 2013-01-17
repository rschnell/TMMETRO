SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE dbo.cmsSkypeCommand 
(
	@SkypeName		varchar(255),
	@SkypeUser		varchar(255),
	@Command		varchar(MAX)
)
AS

SET NOCOUNT ON

DECLARE @UserID 		integer
DECLARE @CaseID			integer
DECLARE @ActionID		integer
DECLARE @Start			integer
DECLARE @End			integer
DECLARE @Count			integer
DECLARE @NewID			integer
DECLARE @DiaryID		integer
DECLARE @PriorityID		integer
DECLARE @AsnUserID		integer
DECLARE @MgrUserID		integer
DECLARE @SubscriptionID	integer
DECLARE @ResolutionID	integer
DECLARE @StatusID		integer
DECLARE @TreeID			integer
DECLARE @TypeOf			integer
DECLARE @SQL			varchar(MAX)
DECLARE @Message		varchar(MAX)
DECLARE @Note			varchar(MAX)
DECLARE @Title			varchar(MAX)
DECLARE @Description	varchar(MAX)
DECLARE @Parameters 	varchar(MAX)
DECLARE @Directive		varchar(255)
DECLARE @P1				varchar(255)
DECLARE @P2				varchar(255)
DECLARE @P3				varchar(255)
DECLARE @P4				varchar(255)
DECLARE @Name			varchar(255)
DECLARE @GroupUsers		varchar(255)
DECLARE @UserName		varchar(255)
DECLARE @Deadline		varchar(255)
DECLARE @NodeName		varchar(255)
DECLARE @Priority		varchar(255)
DECLARE @TimeNow		datetime
DECLARE @Time			numeric(9,3)

CREATE TABLE #tmpCommand (Results varchar(MAX), Extra varchar(MAX))

-- get command and parameters
SET @Command = LTRIM(RTRIM(@Command))
SET @Command = SUBSTRING(@Command,2,LEN(@Command) - 1) -- remove #
SET @Parameters = REPLACE(REPLACE(@Command,CHAR(10),SPACE(1)),CHAR(13),SPACE(1))
WHILE CHARINDEX(SPACE(2),@Parameters) > 0
BEGIN
	SET @Parameters = REPLACE(@Parameters,SPACE(2),SPACE(1))
END
SET @End = CHARINDEX(SPACE(1),@Parameters + SPACE(1))
SET @Directive = SUBSTRING(@Parameters,1,@End - 1)
SET @Start = @End + 1
SET @P1 = ''
SET @P2 = ''
SET @P3 = ''
SET @P4 = ''
IF @Start <= LEN(@Parameters)
BEGIN
	SET @End = CHARINDEX(SPACE(1),@Parameters + SPACE(1),@Start)
	SET @P1 = SUBSTRING(@Parameters,@Start,@End - @Start)
END
SET @Start = @End + 1
IF @Start <= LEN(@Parameters)
BEGIN
	SET @End = CHARINDEX(SPACE(1),@Parameters + SPACE(1),@Start)
	SET @P2 = SUBSTRING(@Parameters,@Start,@End - @Start)
END
SET @Start = @End + 1
IF @Start <= LEN(@Parameters)
BEGIN
	SET @End = CHARINDEX(SPACE(1),@Parameters + SPACE(1),@Start)
	SET @P3 = SUBSTRING(@Parameters,@Start,@End - @Start)
END
SET @Start = @End + 1
IF @Start <= LEN(@Parameters)
BEGIN
	SET @End = CHARINDEX(SPACE(1),@Parameters + SPACE(1),@Start)
	SET @P4 = SUBSTRING(@Parameters,@Start,@End - @Start)
END

--

SELECT 	@CaseID=CaseID,
		@ActionID=ActionID
FROM	TM_Notify..SkypeCHAT AS Skype
WHERE	Skype.Name = @SkypeName

SET @UserID = ISNULL((SELECT TOP 1 UserID FROM USERS WHERE SkypeHandle = @SkypeUser),0)
SET @Message = 'Command unknown'
SET @TimeNow = GETDATE()
SET @Title = ''
SET @Note = ''
SET @TypeOf = 1

--

IF @Directive = 'STATUS'
BEGIN
	IF @P1 = '?'
	BEGIN
		SET @Message = 'Command [status] help.' + CHAR(10)
					 + '#STATUS changed-status' + CHAR(10)
					 + '#STATUS CLOSE resolution' + CHAR(10)
					 + 'In the context of the chat, it will change the status of either the case or action'
	END
	IF @P1 = 'CLOSE'
	BEGIN
		IF @P2 = '?'
		BEGIN
			SET @Message = 'Command [status close] help. #STATUS CLOSE resolution' + CHAR(10)
						+ 'In the context of the chat, it will close either the case or action'
		END
		ELSE
		BEGIN
			IF ISNUMERIC(@P2) = 0
			BEGIN
				SET @P2 = @P2 + SPACE(1) + @P3 + SPACE(1) + @P4
				SET @P2 = RTRIM(@P2)
			END
			SET @ResolutionID = 0
			SET @Count = 0
			DECLARE curList CURSOR FOR SELECT TreeID, NodeName FROM listRESOLUTION ORDER BY TreeID
			OPEN curList
			FETCH NEXT FROM curList INTO @TreeID, @NodeName
			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @Count = @Count + 1
				IF (ISNUMERIC(@P2) = 1 AND @Count = CAST(@P2 AS integer))
				OR (ISNUMERIC(@P2) = 0 AND @NodeName = @P2)
				BEGIN
					SET @ResolutionID = @TreeID
					SET @P3 = @NodeName
				END
				FETCH NEXT FROM curList INTO @TreeID, @NodeName
			END
			CLOSE curList
			DEALLOCATE curList
			IF @ResolutionID > 0
			BEGIN
				EXECUTE cmsClose @CaseID, @ActionID, @UserID, @ResolutionID, @P3, 0
				SET @Message = 'Command [status close] processed, case=' 
							+ CAST(@CaseID AS varchar(10)) 
							+ ' action=' 
							+ CAST(@ActionID AS varchar(10))
							+ ' by=' 
							+ CAST(@UserID AS varchar(10))
							+ ' resolution=' + @P3
							+ ' status=CLOSE'
			END
			ELSE
			BEGIN
				SET @Message = 'Command [status close] not processed. Invalid resolution and/or status'
			END
		END
	END
	IF @P1 <> 'CLOSE' AND @P1 <> '?'
	BEGIN
		BEGIN
			IF ISNUMERIC(@P1) = 0
			BEGIN
				SET @P1 = @P1 + SPACE(1) + @P2 + SPACE(1) + @P3
				SET @P1 = RTRIM(@P1)
			END
			SET @StatusID = 0
			SET @Count = 0
			DECLARE curList CURSOR FOR SELECT TreeID, NodeName FROM listSTATUS ORDER BY TreeID
			OPEN curList
			FETCH NEXT FROM curList INTO @TreeID, @NodeName
			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @Count = @Count + 1
				IF (ISNUMERIC(@P1) = 1 AND @Count = CAST(@P1 AS integer))
				OR (ISNUMERIC(@P1) = 0 AND @NodeName = @P1)
				BEGIN
					SET @StatusID = @TreeID
					SET @P3 = @NodeName
				END
				FETCH NEXT FROM curList INTO @TreeID, @NodeName
			END
			CLOSE curList
			DEALLOCATE curList
			IF @StatusID > 0
			BEGIN
				EXECUTE cmsChangeStatus @CaseID, @ActionID, @UserID, @StatusID, @P3, 0
				SET @Message = 'Command [status] processed, case=' 
							+ CAST(@CaseID AS varchar(10)) 
							+ ' action=' 
							+ CAST(@ActionID AS varchar(10))
							+ ' by=' 
							+ CAST(@UserID AS varchar(10))
							+ ' status=' + @P3
			END
			ELSE
			BEGIN
				SET @Message = 'Command [status] not processed. Invalid status'
			END
		END
	END
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

IF @Directive = 'TIME' OR @Directive = 'HOURS' OR @Directive = 'EFFORT'
BEGIN
	IF @P1 = '?'
	BEGIN
		SET @Message = 'Command [time] help. #TIME hours note' + CHAR(10)
					 + 'Time is recorded against the current action.' + CHAR(10)
					 + 'Time must be decimal hours (e.g. 2.75)'
	END
	ELSE
	BEGIN
		SET @P1 = REPLACE(@P1,',','.') --comma causes SQL error converting data type
		SET @Note = LTRIM(REPLACE(REPLACE('#' + @Command,'#' + @Directive,''),@P1,''))
		IF ISNUMERIC(@P1) = 1
		BEGIN
			IF LEN(@Note) = 0
			BEGIN
				SET @Note = 'Time recorded' 
			END
			EXECUTE cmsTime @CaseID, @ActionID, @UserID, @P1, @Note, @Note, 'T', 0, @TimeNow, @DiaryID output
			SET @Message = 'Command [time] processed, case=' 
						 + CAST(@CaseID AS varchar(10)) 
						 + ' action=' 
						 + CAST(@ActionID AS varchar(10))
						 + ' by=' 
						 + CAST(@UserID AS varchar(10))
		END
		ELSE
		BEGIN
			SET @Message = 'Command [time] not processed. Invalid time. Time must be decimal hours (e.g. 2.75)'
		END
	END
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

IF @Directive = 'BEGIN'
BEGIN
	IF @P1 = '?'
	BEGIN
		SET @Message = 'Command [time begin] help. #BEGIN' + CHAR(10)
					 + 'Used in conjunction with the end/stop time to calculate the elapsed time.'
	END
	ELSE
	BEGIN
		EXECUTE cmsTime @CaseID, @ActionID, @UserID, 0, null, null, 'B', 0, @TimeNow, @DiaryID output
		SET @Message = 'Command [time begin] processed, case=' 
					 + CAST(@CaseID AS varchar(10)) 
					 + ' action=' 
					 + CAST(@ActionID AS varchar(10))
					 + ' by=' 
					 + CAST(@UserID AS varchar(10))
	END
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

IF @Directive = 'END'
BEGIN
	IF @P1 = '?'
	BEGIN
		SET @Message = 'Command [time end] help. #END note' + CHAR(10)
					 + 'Used in conjunction with the begin/start time to calculate the elapsed time.'
	END
	ELSE
	BEGIN
		SET @Note = LTRIM(REPLACE('#' + @Command,'#' + @Directive,''))
		EXECUTE cmsTime @CaseID, @ActionID, @UserID, 0, @Note, null, 'E', 0, @TimeNow, @DiaryID output
		SET @Message = 'Command [time end] processed, case=' 
					 + CAST(@CaseID AS varchar(10)) 
					 + ' action=' 
					 + CAST(@ActionID AS varchar(10))
					 + ' by=' 
					 + CAST(@UserID AS varchar(10))
	END
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

IF @Directive = 'DEADLINE' OR @Directive = 'DATE'
BEGIN
	IF @P1 = '?'
	BEGIN
		SET @Message = 'Command [deadline] help. #DEADLINE days or date (format is DD MMM YYYY or YYYY-MM-DD)'
	END
	ELSE
	BEGIN
		SET @Deadline = LTRIM(REPLACE('#' + @Command,'#' + @Directive,''))
		IF ISDATE(@Deadline) = 0 AND ISNUMERIC(@Deadline) = 1
		BEGIN
			SET @Deadline = CONVERT(varchar(10), DATEADD(day, CAST(@Deadline AS integer), GETDATE()), 120)
		END
		IF ISDATE(@Deadline) = 1
		BEGIN
			EXECUTE cmsDeadline @CaseID, @ActionID, @UserID, @Deadline, 0
			SET @Message = 'Command [deadline] processed, case=' 
						 + CAST(@CaseID AS varchar(10)) 
						 + ' action=' 
						 + CAST(@ActionID AS varchar(10))
						 + ' by=' 
						 + CAST(@UserID AS varchar(10))
						 + ' deadline=' 
						 + CONVERT(varchar(50), @Deadline, 111)
		END
		ELSE
		BEGIN
			SET @Message = 'Command [deadline] invalid date not processed'
		END
	END
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

IF @Directive = 'PRIORITY'
BEGIN
	IF @P1 = '?'
	BEGIN
		SET @Message = 'Command [priority] help. #PRIORITY priority'
	END
	ELSE
	BEGIN
		SET @P1 = @P1 + SPACE(1) + @P2 + SPACE(1) + @P3 + SPACE(1) + @P4
		SET @P1 = RTRIM(@P1)
		SET @PriorityID = 0
		SET @Count = 0
		DECLARE curList CURSOR FOR SELECT TreeID, NodeName FROM listPRIORITY ORDER BY TreeID
		OPEN curList
		FETCH NEXT FROM curList INTO @TreeID, @NodeName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @Count = @Count + 1
			IF (ISNUMERIC(@P1) = 1 AND @Count = CAST(@P1 AS integer))
			OR (ISNUMERIC(@P1) = 0 AND @NodeName = @P1)
			BEGIN
				SET @PriorityID = @TreeID
				SET @P4 = @NodeName
			END
			FETCH NEXT FROM curList INTO @TreeID, @NodeName
		END
		CLOSE curList
		DEALLOCATE curList
		IF @PriorityID > 0
		BEGIN
			EXECUTE cmsPriority @CaseID, @ActionID, @UserID, @PriorityID, 0
			SET @Message = 'Priority changed to ' + @P4
			EXECUTE cmsContribute @CaseID, @ActionID, @UserID, @Message, @Message, 0, @DiaryID output, 5
			SET @Message = 'Command [priority] processed, case=' 
						 + CAST(@CaseID AS varchar(10)) 
						 + ' action=' 
						 + CAST(@ActionID AS varchar(10))
						 + ' by=' 
						 + CAST(@UserID AS varchar(10))
						 + ' priority=' 
						 + CAST(@PriorityID AS varchar(10))
						 + ' ' + @P4
		END
		ELSE
		BEGIN
			SET @Message = 'Command [priority] invalid priority not processed'
		END
	END
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

IF @Directive = 'INVITE' OR @Directive = 'UNINVITE'
BEGIN
	IF @P1 = '?'
	BEGIN
		SET @Message = 'Command [(un)invite] help. #INVITE user | #UNINVITE user'
	END
	ELSE
	BEGIN
		SET @P1 = @P1 + SPACE(1) + @P2 + SPACE(1) + @P3 + SPACE(1) + @P4
		SET @P1 = RTRIM(@P1)
		SET @AsnUserID = 0
		SET @Count = 0
		DECLARE curList CURSOR FOR SELECT UserID, Username FROM cmsListUserGroup(@CaseID) ORDER BY Username ASC
		OPEN curList
		FETCH NEXT FROM curList INTO @TreeID, @NodeName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @Count = @Count + 1
			IF (ISNUMERIC(@P1) = 1 AND @Count = CAST(@P1 AS integer))
			OR (ISNUMERIC(@P1) = 0 AND @NodeName = @P1)
			BEGIN
				SET @AsnUserID = @TreeID
				SET @P4 = @NodeName
			END
			FETCH NEXT FROM curList INTO @TreeID, @NodeName
		END
		CLOSE curList
		DEALLOCATE curList
		IF @AsnUserID > 0
		BEGIN
			IF @Directive = 'INVITE'
			BEGIN
				EXECUTE cmsInvite @CaseID, @ActionID, @AsnUserID, @UserID, 0
				SET @Message = 'Invite ' + @P4
				EXECUTE cmsContribute @CaseID, @ActionID, @UserID, @Message, @Message, 0, @DiaryID output, 5
				SET @Message = 'Command [invite] processed, case=' 
							+ CAST(@CaseID AS varchar(10)) 
							+ ' action=' 
							+ CAST(@ActionID AS varchar(10))
							+ ' by=' 
							+ CAST(@UserID AS varchar(10))
							+ ' invite=' 
							+ CAST(@AsnUserID AS varchar(10))
							+ ' ' + @P4
			END
			ELSE
			BEGIN
				EXECUTE cmsUnInvite @CaseID, @ActionID, @AsnUserID, 0
				SET @Message = 'UnInvite ' + @P4
				EXECUTE cmsContribute @CaseID, @ActionID, @UserID, @Message, @Message, 0, @DiaryID output, 5
				SET @Message = 'Command [uninvite] processed, case=' 
							+ CAST(@CaseID AS varchar(10)) 
							+ ' action=' 
							+ CAST(@ActionID AS varchar(10))
							+ ' by=' 
							+ CAST(@UserID AS varchar(10))
							+ ' uninvite=' 
							+ CAST(@AsnUserID AS varchar(10))
							+ ' ' + @P4
			END
		END
		ELSE
		BEGIN
			SET @Message = 'Command [(un)invite] invalid user not processed'
		END
	END
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

IF @Directive = 'REASSIGN' OR @Directive = 'DELEGATE'
BEGIN
	IF @P1 = '?'
	BEGIN
		SET @Message = 'Command [reassign] help. #REASSIGN assigneduser'
	END
	ELSE
	BEGIN
		SET @P1 = @P1 + SPACE(1) + @P2 + SPACE(1) + @P3 + SPACE(1) + @P4
		SET @P1 = RTRIM(@P1)
		SET @AsnUserID = 0
		SET @Count = 0
		DECLARE curList CURSOR FOR SELECT UserID, Username FROM cmsListUserGroup(@CaseID) ORDER BY Username ASC
		OPEN curList
		FETCH NEXT FROM curList INTO @TreeID, @NodeName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @Count = @Count + 1
			IF (ISNUMERIC(@P1) = 1 AND @Count = CAST(@P1 AS integer))
			OR (ISNUMERIC(@P1) = 0 AND @NodeName = @P1)
			BEGIN
				SET @AsnUserID = @TreeID
				SET @P4 = @NodeName
			END
			FETCH NEXT FROM curList INTO @TreeID, @NodeName
		END
		CLOSE curList
		DEALLOCATE curList
		IF @AsnUserID > 0
		BEGIN
			EXECUTE cmsReassign @CaseID, @ActionID, @AsnUserID, @UserID, 0
			EXECUTE cmsInvite @CaseID, @ActionID, @AsnUserID, @UserID, 0
			SET @Message = 'Reassign to ' + @P4
			EXECUTE cmsContribute @CaseID, @ActionID, @UserID, @Message, @Message, 0, @DiaryID output, 5
			SET @Message = 'Command [reassign] processed, case=' 
						 + CAST(@CaseID AS varchar(10)) 
						 + ' action=' 
						 + CAST(@ActionID AS varchar(10))
						 + ' by=' 
						 + CAST(@UserID AS varchar(10))
						 + ' assign=' 
						 + CAST(@AsnUserID AS varchar(10))
						 + ' ' + @P4
		END
		ELSE
		BEGIN
			SET @Message = 'Command [reassign] invalid assigned user not processed'
		END
	END
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

IF @Directive = 'CASE'
OR @Directive = 'ACTION'
OR @Directive = 'ISSUE'
OR @Directive = 'TITLE'
BEGIN
	SET @MgrUserID = @UserID
	SET @PriorityID = 0
	SET @Priority = ''
	SET @AsnUserID = 0
	SET @UserName = ''
	SET @Title = ''
	SET @Note = ''
	SET @End = CHARINDEX(SPACE(1),@Command + SPACE(1))
	SET @Start = @End + 1
	-- Title
	IF @Start <= LEN(@Command)
	BEGIN
		SET @End = CHARINDEX('^',@Command + '^',@Start)
		SET @Title = SUBSTRING(@Command,@Start,@End - @Start)
	END
	ELSE
	BEGIN
		SET @Message = @Message + 'Title missing' + CHAR(10)
	END
	SET @Start = @End + 1
	-- Description
	IF @Start <= LEN(@Command)
	BEGIN
		SET @End = CHARINDEX('^',@Command + '^',@Start)
		SET @Note = SUBSTRING(@Command,@Start,@End - @Start)
	END
	SET @Start = @End + 1
	-- Priority
	IF @Start <= LEN(@Command)
	BEGIN
		SET @End = CHARINDEX('^',@Command + '^',@Start)
		SET @P4 = SUBSTRING(@Command,@Start,@End - @Start)
		SET @Count = 0
		DECLARE curList CURSOR FOR SELECT TreeID, NodeName FROM listPRIORITY ORDER BY TreeID
		OPEN curList
		FETCH NEXT FROM curList INTO @TreeID, @NodeName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @Count = @Count + 1
			IF (ISNUMERIC(@P4) = 1 AND @Count = CAST(@P4 AS integer))
			OR (ISNUMERIC(@P4) = 0 AND @NodeName = @P4)
			BEGIN
				SET @PriorityID = @TreeID
				SET @Priority = @NodeName
			END
			FETCH NEXT FROM curList INTO @TreeID, @NodeName
		END
		CLOSE curList
		DEALLOCATE curList
	END
	SET @Start = @End + 1
	-- Deadline
	IF @Start <= LEN(@Command)
	BEGIN
		SET @End = CHARINDEX('^',@Command + '^',@Start)
		SET @Deadline = SUBSTRING(@Command,@Start,@End - @Start)
	END
	SET @Start = @End + 1
	-- User
	IF @Start <= LEN(@Command)
	BEGIN
		SET @End = CHARINDEX('^',@Command + '^',@Start)
		SET @P4 = SUBSTRING(@Command,@Start,@End - @Start)
		SET @Count = 0
		DECLARE curList CURSOR FOR SELECT UserID, Username FROM cmsListUserGroup(@CaseID) ORDER BY Username ASC
		OPEN curList
		FETCH NEXT FROM curList INTO @TreeID, @NodeName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @Count = @Count + 1
			IF (ISNUMERIC(@P4) = 1 AND @Count = CAST(@P4 AS integer))
			OR (ISNUMERIC(@P4) = 0 AND @NodeName = @P4)
			BEGIN
				SET @AsnUserID = @TreeID
				SET @UserName = @NodeName
			END
			FETCH NEXT FROM curList INTO @TreeID, @NodeName
		END
		CLOSE curList
		DEALLOCATE curList
	END

	IF @Directive = 'CASE'
	BEGIN
		IF @P1 = '?'
		BEGIN
			SET @Message = 'Command [new case] help. #CASE Title^Description^Priority' + CHAR(10)
						 + '(Use [^] character to seperate parameters. '
						 + 'This then allows spaces and line feeds to be part of the description, etc.)'
		END
		ELSE
		BEGIN
			SET @Message = 'Command [case]' + CHAR(10)
			IF LEN(@Title) > 0 AND LEN(@Note) > 0
			BEGIN
				SET @SubscriptionID = (SELECT SubscriptionID FROM CASES WHERE CaseID = @CaseID)
				EXECUTE cmsNewCase @UserID, @Title, @Note, @PriorityID, 0, @NewID output, @DiaryID output, @TypeOf, @SubscriptionID
				SET @Message = @Message 
							 + '*** Awaiting manager to OPEN case ***' + CHAR(10)
							 + 'CaseID=' + CAST(@NewID AS varchar(10)) + CHAR(10)
							 + 'Title=' + @Title + CHAR(10)
							 + 'Description=' + @Note + CHAR(10)
							 + 'Priority=' + @Priority
			END
			ELSE
			BEGIN
				SET @Message = @Message + 'Command [case] not processed. Must contain title and description'
			END
		END
	END

	IF @Directive = 'ACTION'
	BEGIN
		IF @P1 = '?'
		BEGIN
			SET @Message = 'Command [action] help. #ACTION Title^Description^Priority^Deadline^User' + CHAR(10)
						 + 'Use [^] character to seperate parameters. '
						 + 'This then allows spaces and line feeds to be part of the description, etc.' + CHAR(10)
						 + 'Date format is DD MMM YYYY or YYYY-MM-DD'
		END
		ELSE
		BEGIN
			IF @CaseID > 0
			BEGIN
				IF LEN(@Title) > 0 AND LEN(@Note) > 0
				BEGIN
					SET @Message = 'Command [action]' + CHAR(10)
					EXECUTE cmsNewAction @CaseID, @MgrUserID, @AsnUserID, @Title, @Note, @PriorityID, @Deadline, 0, @NewID output, @DiaryID output, @TypeOf
					SET @Message = @Message 
								 + 'CaseID=' + CAST(@CaseID AS varchar(10)) + CHAR(10)
								 + 'ActionID=' + CAST(@NewID AS varchar(10)) + CHAR(10)
								 + 'Title=' + @Title + CHAR(10)
								 + 'Description=' + @Note + CHAR(10)
								 + 'Assigned=' + @UserName + CHAR(10)
								 + 'Priority=' + @Priority + CHAR(10)
								 + 'Deadline=' + CONVERT(varchar(50), @Deadline, 111)
				END
				ELSE
				BEGIN
					SET @Message = @Message + 'Command [action] not processed. Must contain title and description'
				END
			END
			ELSE
			BEGIN
				SET @Message = 'Command [action] not processed. Must be related to an existing action'
			END
		END
	END

	IF @Directive = 'ISSUE'
	BEGIN
		IF @P1 = '?'
		BEGIN
			SET @Message = 'Command [issue] help. #ISSUE Title^Description^Priority' + CHAR(10)
						 + '(Use [^] character to seperate parameters. '
						 + 'This then allows spaces and line feeds to be part of the description, etc.)'
		END
		ELSE
		BEGIN
			IF @CaseID > 0
			BEGIN
				IF LEN(@Title) > 0 AND LEN(@Note) > 0
				BEGIN
					SET @Message = 'Command [issue]' + CHAR(10)
					EXECUTE cmsNewIssue @CaseID, @AsnUserID, @Title, @Note, @PriorityID, 0, @NewID output, @DiaryID output, @TypeOf, @ActionID
					SET @Message = @Message 
								 + 'CaseID=' + CAST(@CaseID AS varchar(10)) + CHAR(10)
								 + 'IssueID=' + CAST(@NewID AS varchar(10)) + CHAR(10)
								 + 'Title=' + @Title + CHAR(10)
								 + 'Description=' + @Note + CHAR(10)
								 + 'Assigned=' + @UserName + CHAR(10)
								 + 'Priority=' + @Priority
				END
				ELSE
				BEGIN
					SET @Message = @Message + 'Command [issue] not processed. Must contain title and description'
				END
			END
			ELSE
			BEGIN
				SET @Message = 'Command [issue] not processed. Must be related to an existing issue'
			END
		END
	END

	IF @Directive = 'TITLE'
	BEGIN
		IF @P1 = '?'
		BEGIN
			SET @Message = 'Command [title] help. #TITLE Title^Description' + CHAR(10)
						 + '(Use [^] character to seperate parameters. '
						 + 'This then allows spaces and line feeds to be part of the description, etc.)'
		END
		ELSE
		BEGIN
			IF @CaseID > 0
			BEGIN
				IF LEN(@Title) > 0
				BEGIN
					SET @Message = 'Command [title]' + CHAR(10)
					EXECUTE cmsUpdateTitleNote @CaseID, @ActionID, @UserID, @Title, @Note, @Note
					SET @Message = @Message 
								 + 'CaseID=' + CAST(@CaseID AS varchar(10)) + CHAR(10)
								 + 'ActionID=' + CAST(@ActionID AS varchar(10)) + CHAR(10)
								 + 'Title=' + @Title + CHAR(10)
								 + 'Description=' + @Note
				END
				ELSE
				BEGIN
					SET @Message = @Message + 'Command [title] not processed. Must contain title'
				END
			END
			ELSE
			BEGIN
				SET @Message = 'Command [title] not processed. Must be related to an existing case or action'
			END
		END
	END
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

IF @Directive = 'LIST'
BEGIN
	SET @P4 = @P1
	IF 'AT' = SUBSTRING(@P1,1,2)
	BEGIN
		SET @P1 = 'T'
	END
	ELSE
	BEGIN
		SET @P1 = SUBSTRING(@P1,1,1)
	END
	EXECUTE cmsList @CaseID, @ActionID, 0, @P1
	SET @Message = 'Command [list] processed'
	INSERT INTO #tmpCommand (Results) VALUES (@Message)
END

--

SELECT	Results,
		@Directive	AS Directive,
		@P1			AS P1,
		@P2			AS P2,
		@P3			AS P3,
		@P4			AS P4
FROM	#tmpCommand

DROP TABLE #tmpCommand

GO
