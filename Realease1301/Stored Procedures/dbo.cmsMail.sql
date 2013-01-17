SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE dbo.cmsMail 
(
	@SubscriptionID integer,
	@DiaryID		integer
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
DECLARE @URL				varchar(500)
DECLARE @Error				varchar(500)
-------------------------------------------------------------------------------
SET @Client				= 'TeamMacro'
SET @SystemShortName	= 'TM'
SET @SystemLongName		= RTRIM((SELECT TOP 1 TMRole FROM SUBSCRIPTIONS WHERE SubscriptionID = @SubscriptionID))
SET @ThisYear           = CAST(YEAR(GETDATE()) AS varchar(4))
SET @CopyrightYear		= '2000-' + @ThisYear
SET @ColourHead			= ISNULL((SELECT TOP 1 color3 FROM THEMES WHERE SubscriptionID = @SubscriptionID),'#B0B0B0')
SET @ColourOdd			= ISNULL((SELECT TOP 1 color7 FROM THEMES WHERE SubscriptionID = @SubscriptionID),'#F0F0F0')
SET @ColourEven			= '#FFFFFF' --'#D0D0D0'
SET @EmailFrom			= 'dontreply@teammacro.com'
SET @URL				= RTRIM((SELECT TOP 1 HomeURL FROM SUBSCRIPTIONS WHERE SubscriptionID = @SubscriptionID))
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
-------------------------------------------------------------------------------
IF SUBSTRING(@URL, LEN(@URL), 1) <> '/'
BEGIN
	SET @URL = @URL + '/'
END
IF LOWER(SUBSTRING(@URL, 1, 4)) <> 'http'
BEGIN
	SET @URL = 'http://' + @URL
END
-------------------------------------------------------------------------------
SELECT	@EmailFrom										AS [EmailFrom],
		ISNULL(USERS_Xref.Email,@Error)					AS [EmailTo],
		@Error											AS [Email],
		@URL											AS [|URL|],
		@Client											AS [|CLIENTNAME|],
		@SystemLongName									AS [|SYSNAMELONG|],
		@SystemShortName								AS [|SYSNAMESHORT|],
		@CopyrightYear									AS [|COPYYEAR|],
		@ColourHead										AS [|COLOURHEAD|],
		@ColourOdd										AS [|COLOURODD|],
		@ColourEven										AS [|COLOUREVEN|],
	 	ISNULL(DIARY.CaseID,0)							AS [|CASEID|],
		ISNULL(DIARY.ActionID,0)						AS [|ACTIONID|],
		ISNULL(DIARY.DiaryID,0)							AS [|DIARYID|],
		RTRIM(ISNULL(USERS_Contribution.UserName,''))	AS [|UPDATEDBY|],
		RTRIM(ISNULL(CASES.Title,''))					AS [|CASE_TITLE|],
		RTRIM(ISNULL(CASES_Description.Note,''))		AS [|CASE_DESCRIPTION|],
		RTRIM(ISNULL(USERS_Case.UserName,''))			AS [|CASE_MANAGER|],
		RTRIM(ISNULL(ACTIONS.Title,''))					AS [|ACTION_TITLE|],
		RTRIM(ISNULL(ACTIONS_Description.Note,''))		AS [|ACTION_DESCRIPTION|],
		RTRIM(ISNULL(USERS_Action.UserName,''))			AS [|ACTION_ASSIGN|],
		CASE WHEN ISNULL(DIARY.IsDescription,0) = 0
		     THEN RTRIM(ISNULL(DIARY.Note,''))
		     ELSE '' END								AS [|CONTRIBUTION|]
INTO	#tmpMAIL
FROM	DIARY
		LEFT JOIN CASES							ON CASES.CaseID = DIARY.CaseID
		LEFT JOIN ACTIONS						ON ACTIONS.ActionID = DIARY.ActionID
		LEFT JOIN DIARY AS CASES_Description	ON CASES_Description.CaseID = DIARY.CaseID 
													AND CASES_Description.IsDescription = 1
													AND CASES_Description.ActionID = 0 
		LEFT JOIN DIARY AS ACTIONS_Description	ON ACTIONS_Description.CaseID = DIARY.CaseID 
													AND ACTIONS_Description.ActionID = DIARY.ActionID 
													AND ACTIONS_Description.IsDescription = 1
													AND ACTIONS_Description.ActionID > 0 
		LEFT JOIN USERS AS USERS_Contribution	ON USERS_Contribution.UserID = DIARY._CMSUSERSRaised
													AND (DIARY.IsDescription = 0 OR DIARY.IsDescription IS NULL)
		LEFT JOIN USERS AS USERS_Case			ON USERS_Case.UserID = CASES._CMSUSERSManagedBy
		LEFT JOIN USERS AS USERS_Action			ON USERS_Action.UserID = ACTIONS._CMSUSERSManagedBy
		LEFT JOIN CASESXUSERS					ON CASESXUSERS.CaseID = DIARY.CaseID
													AND CASESXUSERS.ActionID = DIARY.ActionID
		LEFT JOIN USERS AS USERS_Xref			ON USERS_Xref.UserID = CASESXUSERS.UserID
													AND LEN(USERS_Xref.Email) > 0
WHERE	DIARY.DiaryID = @DiaryID
-------------------------------------------------------------------------------
SELECT	@CaseID = [|CASEID|],
		@CaseTitle = [|CASE_TITLE|],
		@ActionID = [|ACTIONID|],
	 	@ActionTitle = [|ACTION_TITLE|]
FROM	#tmpMAIL
SET @EmailSubject = @SystemShortName + ':' + @SystemLongName + ':' + CAST(@CaseID AS varchar(10))
IF @ActionID > 0
BEGIN
	SET @EmailSubject = @EmailSubject + ':' + CAST(@ActionID AS varchar(10))
END
SET @EmailSubject = @EmailSubject + ' ' + @CaseTitle
IF @ActionID > 0
BEGIN
	IF LEN(@ActionTitle) = 0
	BEGIN
		SET @ActionTitle = CAST(@ActionID AS varchar(10))
	END
	SET @EmailSubject = @EmailSubject + '\' + @ActionTitle
END
-------------------------------------------------------------------------------
SELECT	@EmailSubject AS [EmailSubject],
		#tmpMAIL.*
FROM	#tmpMAIL

GO
