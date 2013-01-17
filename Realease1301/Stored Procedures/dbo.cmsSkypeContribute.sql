SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE dbo.cmsSkypeContribute 
(
	@ChatName				nvarchar(MAX),
	@ChatTopic				nvarchar(MAX),
	@FromHandle				nvarchar(MAX),
	@MsgBody				nvarchar(MAX)=''
)
AS

SET NOCOUNT ON

DECLARE @CaseID				integer
DECLARE @UserID				integer
DECLARE @DiaryID			integer
DECLARE @ActionID			integer
DECLARE @Start				integer
DECLARE @End				integer
DECLARE @TimeNow			datetime
DECLARE @Case				varchar(255)
DECLARE @Status				varchar(255)
DECLARE @Database			varchar(255)

IF SUBSTRING(LTRIM(@MsgBody),1,1) = '!' -- conversational chat not recorded
BEGIN
	SET @CaseID = 0
	SET @DiaryID = 0
	SET @ActionID = 0
	SET @UserID = 0
	SET @Status = 'Conversation not recorded'
END
ELSE
BEGIN
	SET @CaseID = 0
	SET @DiaryID = 0
	SET @ActionID = 0
	SET @UserID = 0
	SET @Status = ''
	SET @TimeNow = GETDATE()
	SET @CaseID = ISNULL((SELECT CaseID FROM TM_Notify..SkypeCHAT WHERE [Name] = @ChatName),0)
	SET @ActionID = ISNULL((SELECT ActionID FROM TM_Notify..SkypeCHAT WHERE [Name] = @ChatName),0)
	
	IF @CaseID = 0 -- extract from topic the case and action
	BEGIN
		SET @Start = CHARINDEX(':',@ChatTopic) + 1
		IF @Start > 1
		BEGIN
			SET @End = CHARINDEX(':',@ChatTopic,@Start) - @Start
			IF @End < 1
				SET @End = CHARINDEX(' ',@ChatTopic + ' ',@Start) - @Start
			SET @Case = SUBSTRING(@ChatTopic,@Start,@End)
			SET @Start = CHARINDEX(':',@ChatTopic,@End) + 1
			IF @Start > 1
			BEGIN
				SET @End = CHARINDEX(' ',@ChatTopic + ' ',@Start) - @Start
				IF ISNUMERIC(SUBSTRING(@ChatTopic,@Start,@End)) = 1
				BEGIN
					SET @ActionID = SUBSTRING(@ChatTopic,@Start,@End)
				END
			END
		END
		SET @CaseID = ISNULL((SELECT TOP 1 CaseID FROM CASES WHERE CaseID = @Case),0)
		IF @CaseID > 0
		BEGIN
			SET @Database = DB_NAME()
			EXECUTE TM_Notify..cmsSkypeSetChat @Database, @ChatName, @ChatTopic, @CaseID, @ActionID
			SET @Status = @Status + 'New chat' + CHAR(10)
		END
		ELSE
		BEGIN
			SET @Status = @Status + 'Cannot identify case' + CHAR(10)
		END
	END

	IF @CaseID > 0 -- contribution recorded
	BEGIN
		SET @UserID = ISNULL((SELECT TOP 1 U.UserID
								FROM USERS AS U
								INNER JOIN CASESXUSERS AS C ON C.CaseID = @CaseID AND C.ActionID = @ActionID AND C.UserID = U.UserID
								WHERE U.SkypeHandle = @FromHandle 
								ORDER BY Active DESC),0)
		SET @MsgBody = RTRIM(LTRIM(@MsgBody))
		IF LEN(@MsgBody) > 0
		BEGIN
			EXECUTE cmsContribute @CaseID, @ActionID, @UserID, @MsgBody, @MsgBody, 0, @DiaryID output, 101
			SET @Status = @Status + 'Contribution added'
		END
		ELSE
		BEGIN
			SET @Status = @Status + 'No contribution provided'
		END
	END
	ELSE
	BEGIN
		SET @Status = @Status + 'Unknown case'
	END
END

SELECT @Status AS Status, @CaseID AS CaseID, @UserID AS UserID, @ActionID AS ActionID, @DiaryID AS DiaryID, DB_NAME() AS 'Database'

GO
