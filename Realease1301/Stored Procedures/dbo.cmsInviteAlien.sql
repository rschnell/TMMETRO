SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[cmsInviteAlien] 
(
	@InviteByID			integer,
	@CaseID				integer = 0,
	@ActionID			integer = 0,
	@SubscriptionID		integer = 0,
	@SkypeHandle		varchar(50),
	@Email				varchar(1000),
	@Message			varchar(MAX),
	@HomeURL            varchar(250),
	@LocalID			integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Date			datetime
DECLARE @Error			integer
DECLARE @RandomNo		integer
DECLARE @URL			varchar(1000)
DECLARE @GUID			uniqueidentifier
DECLARE @SecurityCode	varchar(50)
DECLARE @Password		varchar(50)

SET @Date = GETDATE()
SET @Error = 0
SET @GUID = NEWID()
SET @SecurityCode = REPLACE(@GUID,'-','')
-------------------------------------------------------------------------------
IF SUBSTRING(@HomeURL, LEN(@HomeURL), 1) <> '/'
BEGIN
	SET @HomeURL = @HomeURL + '/'
END
IF LOWER(SUBSTRING(@HomeURL, 1, 4)) <> 'http'
BEGIN
	SET @HomeURL = 'http://' + @HomeURL
END
-------------------------------------------------------------------------------
SET @URL = RTRIM(@HomeURL)
		 + 'Default.aspx?inviteID='
		 + @SecurityCode
		 + '&Email='
		 + RTRIM(@Email)
		 + '&SubId='
		 + CAST(@SubscriptionID AS VARCHAR(50))
		 + '&InviteById='
		 + CAST(@InviteByID AS VARCHAR(50))
--SET @RandomNo = ((@@PACK_SENT + @@PACK_RECEIVED) % 10000000) * (@@IDLE % 1000)
--SET @Password = SUBSTRING(REVERSE(CAST(@RandomNo AS varchar(50))),1,7)

IF @CaseID > 0
BEGIN
	IF ISNULL((SELECT CaseID FROM CASES WHERE CaseID = @CaseID),0) = 0
	BEGIN
		SET @Error = 101 -- ERROR: Unknown/invalid case
	END
END

IF @ActionID > 0
BEGIN
	IF ISNULL((SELECT ActionID FROM ACTIONS WHERE CaseID = @CaseID AND ActionID = @ActionID),0) = 0
	BEGIN
		SET @Error = 102 -- ERROR: Unknown/invalid action
	END
END

IF ISNULL((SELECT UserID FROM USERS WHERE UserID = @InviteByID),0) = 0
BEGIN
	SET @Error = 103 -- ERROR: Unknown/invalid user
END

IF @Error = 0
BEGIN
	INSERT INTO ALIENINVITES ([InviteDate], [Email], [SkypeHandle], [SubscriptionID], [CaseID], [ActionID], [UserID], [Message], [URL], [SecurityCode], [Password])
		VALUES (@Date, @Email, @SkypeHandle, @SubscriptionID, @CaseID, @ActionID, @InviteByID, @Message, @URL, @SecurityCode, @Password)
	--SET @Message = 'Password: ' + @Password + '<br><br>'
	--			 + @Message
	IF LEN(@SkypeHandle) > 0
	BEGIN
		INSERT INTO TM_Notify..SkypeNOTIFY ([Database], [Status], [SubscriptionID], [DiaryID], [NotifyTime], [SkypeHandle], [UserID], [URL], [Message])
			VALUES (DB_NAME(), 0, @SubscriptionID, 0, @Date, @SkypeHandle, @InviteByID, @URL, @Message) 
	END
	
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID


GO
