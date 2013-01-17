SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE dbo.cmsMailInvite 
(
	@SubscriptionID integer,
	@UserID			integer,
	@Email			varchar(1000),
	@URL			varchar(1000),
	@Message		ntext = ''
)
AS
SET NOCOUNT ON

DECLARE @Client				varchar(1000)
DECLARE @SystemLongName		varchar(1000)
DECLARE @SystemShortName	varchar(50)
DECLARE @ThisYear			varchar(4)
DECLARE @CopyrightYear		varchar(50)
DECLARE @ColourHead			varchar(50)
DECLARE @ColourOdd			varchar(50)
DECLARE @ColourEven			varchar(50)
DECLARE @EmailFrom			varchar(100)
DECLARE @EmailSubject		varchar(1000)
DECLARE @CaseID				integer
DECLARE @CaseTitle			varchar(1000)
DECLARE @ActionID			integer
DECLARE @ActionTitle		varchar(1000)
DECLARE @Error				varchar(500)

-- the following should come from subscription preferences
SET @Client				= 'TeamMacro'
SET @SystemShortName	= 'TM'
SET @SystemLongName		= RTRIM((SELECT TOP 1 TMRole FROM SUBSCRIPTIONS WHERE SubscriptionID = @SubscriptionID))
SET @ThisYear           = CAST(YEAR(GETDATE()) AS varchar(4))
SET @CopyrightYear		= '2000-' + @ThisYear
SET @ColourHead			= ISNULL((SELECT TOP 1 color3 FROM THEMES WHERE SubscriptionID = @SubscriptionID),'#B0B0B0')
SET @ColourOdd			= ISNULL((SELECT TOP 1 color7 FROM THEMES WHERE SubscriptionID = @SubscriptionID),'#F0F0F0')
SET @ColourEven			= '#FFFFFF' --'#D0D0D0'
SET @EmailFrom			= 'dontreply@teammacro.com'
SET @EmailSubject		= 'Invite to ' + @SystemLongName
SET @Error				= ISNULL((SELECT TOP 1 USERS.Email
								  FROM SUBSXUSERS
								  INNER JOIN USERS ON USERS.UserID = SUBSXUSERS.UserID
								  WHERE SUBSXUSERS.SubscriptionID = @SubscriptionID
								  AND SUBSXUSERS.IsSubManager = 1),'matthew.cawley@synergistic.to')
-------------------------------------------------------------------------------
IF LEN(@SystemLongName) > 2
BEGIN
	SET @SystemShortName = SUBSTRING(@SystemLongName, 1, 2)
	SET @SystemLongName = SUBSTRING(@SystemLongName, 3, LEN(@SystemLongName) -2)
END
SET @EmailSubject		= 'Invite to ' + @SystemShortName + ':' + @SystemLongName
-------------------------------------------------------------------------------
SELECT	RTRIM(@EmailSubject)					AS [EmailSubject],
		RTRIM(@EmailFrom)						AS [EmailFrom],
		RTRIM(@Email)							AS [EmailTo],
		RTRIM(ISNULL(USERS.Email,@Error))		AS [Email],
		RTRIM(@URL)								AS [|URL|],
		RTRIM(@Client)							AS [|CLIENTNAME|],
		RTRIM(@SystemLongName)					AS [|SYSNAMELONG|],
		RTRIM(@SystemShortName)					AS [|SYSNAMESHORT|],
		RTRIM(@CopyrightYear)					AS [|COPYYEAR|],
		RTRIM(@ColourHead)						AS [|COLOURHEAD|],
		RTRIM(@ColourOdd)						AS [|COLOURODD|],
		RTRIM(@ColourEven)						AS [|COLOUREVEN|],
		RTRIM(ISNULL(USERS.Firstname,'')) + ' '
			+ RTRIM(ISNULL(USERS.Lastname,''))	AS [|INVITEBY|],
		ISNULL(@Message,'')						AS [|MESSAGE|]
FROM	USERS
WHERE USERS.UserID = @UserID

GO
