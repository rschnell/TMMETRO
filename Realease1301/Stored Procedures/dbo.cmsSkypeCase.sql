SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE dbo.cmsSkypeCase 
(
	@DiaryID	integer
)
AS

SET NOCOUNT ON

DECLARE @List				varchar(MAX)
DECLARE @SkypeHandle		varchar(100)
DECLARE @SystemLongName		varchar(1000)
DECLARE @SystemShortName	varchar(50)
DECLARE @SubscriptionID		integer

SET @List = ''
SET @SubscriptionID = ISNULL((SELECT CASES.SubscriptionID FROM DIARY
							  INNER JOIN CASES ON CASES.CaseID = DIARY.CaseID
							  WHERE DIARY.DiaryID = @DiaryID),0)
SET @SystemShortName = 'TM'
SET @SystemLongName = RTRIM((SELECT TMRole FROM SUBSCRIPTIONS WHERE SubscriptionID = @SubscriptionID))
-------------------------------------------------------------------------------
IF LEN(@SystemLongName) > 2
BEGIN
	SET @SystemShortName = SUBSTRING(@SystemLongName, 1, 2)
	SET @SystemLongName = SUBSTRING(@SystemLongName, 3, LEN(@SystemLongName) -2)
END
-------------------------------------------------------------------------------
DECLARE curUsers CURSOR FOR
	SELECT USERS.SkypeHandle
	FROM DIARY
	INNER JOIN CASESXUSERS ON CASESXUSERS.CaseID = DIARY.CaseID AND CASESXUSERS.ActionID = DIARY.ActionID
	INNER JOIN USERS ON USERS.UserID = CASESXUSERS.UserID
	WHERE DIARY.DiaryID = @DiaryID AND LEN(USERS.SkypeHandle) > 0 AND USERS.Active = 1
	FOR READ ONLY
OPEN curUsers
FETCH NEXT FROM curUsers INTO @SkypeHandle
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @List = @List + @SkypeHandle + '|'
	FETCH NEXT FROM curUsers INTO @SkypeHandle
END
CLOSE curUsers
DEALLOCATE curUsers
-------------------------------------------------------------------------------
SELECT 	TOP 1
		DIARY.CaseID,
		DIARY.ActionID,
		DIARY.DiaryID,
		CASE WHEN (DIARY.IsDescription = 0 OR DIARY.IsDescription IS NULL) THEN DIARY.Note ELSE '' END AS Note,
		USERS_Contribution.UserID					AS Contribution_UserID,
		ISNULL(USERS_Contribution.UserName,'')		AS Contribution_UserName,
		ISNULL(USERS_Contribution.SkypeHandle,'')	AS Contribution_SkypeHandle,
		ISNULL(CASES.Title,'')						AS Case_Title,
		CASES_Description.DiaryID					AS Case_DescriptionID,
		CASES_Description.Note						AS Case_Description,
		USERS_Case.UserID							AS Case_UserID,
		ISNULL(USERS_Case.UserName,'')				AS Case_UserName,
		ISNULL(USERS_Case.SkypeHandle,'')			AS Case_SkypeHandle,
		ISNULL(ACTIONS.Title,'')					AS Action_Title,
		ACTIONS_Description.DiaryID					AS Action_DescriptionID,
		ACTIONS_Description.Note					AS Action_Description,
		ACTIONS.IsIssue,
		USERS_Action.UserID							AS Action_UserID,
		ISNULL(USERS_Action.UserName,'')			AS Action_UserName,
		ISNULL(USERS_Action.SkypeHandle,'')			AS Action_SkypeHandle,
		ISNULL(Skype.Name,'')						AS SkypeName,
		ISNULL(@List,'')							AS SkypeHandleGroup,
		@SystemShortName							AS SystemShortName,
		@SystemLongName								AS SystemLongName
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
		LEFT JOIN USERS AS USERS_Action			ON USERS_Action.UserID = ACTIONS._CMSUsersManagedBy
		LEFT JOIN TM_Notify..SkypeCHAT			AS Skype
												ON Skype.CaseID = DIARY.CaseID
													AND Skype.ActionID = DIARY.ActionID
WHERE	DIARY.DiaryID = @DiaryID

GO
