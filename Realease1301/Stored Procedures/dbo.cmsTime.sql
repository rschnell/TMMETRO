SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[cmsTime] 
(
	@CaseID			integer,
	@ActionID		integer,
	@UserID			integer,
	@Time			decimal(9,3),
	@Note			nvarchar(MAX),
	@Description	nvarchar(MAX),
	@Command		char(1) = 'T',
	@LocalID		integer = 0,
	@ValueDate		datetime,
	@DiaryID		integer output
)
AS

SET NOCOUNT ON

DECLARE @Error		integer
DECLARE @ValueType	integer
DECLARE @TimeID 	integer
DECLARE @TimeNow	datetime
DECLARE @TimeStart	datetime
DECLARE @TimeEffort	varchar(50) 
DECLARE @Hours		integer
DECLARE @Minutes	decimal

SET @TimeNow = GETDATE()
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

IF @Hours <= 0 
BEGIN
    SET @Error = 118 -- ERROR: Hours must be greater than zero
END

IF @ValueDate > @TimeNow
BEGIN
    SET @Error = 119 -- ERROR: Future time is not allowed
END

IF @Error = 0
BEGIN
	IF @Command = 'T' -- time taken
	BEGIN
		IF LEN(@Note) = 0
		BEGIN
			SET @Note = 'Time taken.' 
		END
		SET @ValueType = 15
		INSERT INTO DIARY (CaseID, ActionID, IsDescription, Note, _CMSUsersRaised, _CMSDateUpdated, _CMSTypeOf)
					VALUES (@CaseID, @ActionID, 0, @Note, @UserId, @TimeNow, 5)
		SET @DiaryID = SCOPE_IDENTITY()
		INSERT INTO [VALUES] (DiaryID, ValueTypeID, Value, Description, ValueDate, Active)
					VALUES (@DiaryID, @ValueType, @Time, @Description, @ValueDate, 1)
	END
	IF @Command = 'B' -- begin time
	BEGIN
		SET @TimeID = ISNULL((SELECT TimeID FROM USERTIMES WHERE UserID = @UserID AND CaseID = @CaseID AND ActionID = @ActionID),0)
		IF @TimeID = 0
		BEGIN
			INSERT INTO USERTIMES (UserID, CaseID, ActionID, TimeStart)
						VALUES (@UserID, @CaseID, @ActionID, @TimeNow)
		END
		ELSE
		BEGIN
			UPDATE USERTIMES SET TimeStart = @TimeNow
			WHERE  TimeID = @TimeID
		END
	END
	IF @Command = 'E' -- end time
	BEGIN
		SET @TimeEffort = ''
		SET @TimeStart = ISNULL((SELECT TimeStart FROM USERTIMES WHERE UserID = @UserID AND CaseID = @CaseID AND ActionID = @ActionID),@TimeNow)
		SET @Hours = DATEDIFF(Minute,@TimeStart,@TimeNow) / 60
		SET @Minutes = DATEDIFF(Minute,@TimeStart,@TimeNow) % 60
		IF @Minutes <> 0
		BEGIN
			SET @Minutes = @Minutes / 60 * 100
		END
		IF @Minutes < 10
		BEGIN
			SET @TimeEffort = CAST(@Hours AS varchar(50)) + '.0' + CAST(@Minutes AS varchar(50))
		END
		ELSE
		BEGIN
			SET @TimeEffort = CAST(@Hours AS varchar(50)) + '.' + CAST(@Minutes AS varchar(50))
		END
		IF @TimeEffort = '' OR @TimeEffort = '.'
		BEGIN
			SET @TimeEffort = '0'
		END
		SET @Time = @TimeEffort
		IF LEN(@Note) = 0
		BEGIN
			SET @Note = 'Time taken (calculated) from ' 
					+ CONVERT(varchar(50), @TimeStart, 120) 
					+ ' to '
					+ CONVERT(varchar(50), @TimeNow, 120)
		END
		SET @ValueType = 15
		INSERT INTO DIARY (CaseID, ActionID, IsDescription, Note, _CMSUsersRaised, _CMSDateUpdated, _CMSTypeOf)
					VALUES (@CaseID, @ActionID, 0, @Note, @UserId, @TimeNow, 5)
		SET @DiaryID = SCOPE_IDENTITY()
		INSERT INTO [VALUES] (DiaryID, ValueTypeID, Value, Description, ValueDate, Active)
					VALUES (@DiaryID, @ValueType, @Time, @Description, @ValueDate, 1)
	END
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID

GO
