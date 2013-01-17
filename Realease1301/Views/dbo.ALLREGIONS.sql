SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ALLREGIONS]
AS
SELECT     dbo.USERS.GROUPID AS SUBSCRIPTIONID, dbo.USERS.CodeOrganization, dbo.CASESTREE.NODENAME AS [REGION NAME], dbo.USERS.DepartmentID, 
                      dbo.USERS.PARENTID AS [MANAGER ID], USERS_1.SUBSCRIPTIONID AS [REGION CODE], dbo.CASESTREE.CATEGORYID AS [REGION CATEGORY], 
                      dbo.USERS.Email AS [Country Manager], USERS_1.Email AS [Regional Manager], dbo.USERS.CodeCompany AS [COMPANY CODE], 
                      dbo.USERS.CodeCountry AS [COUNTRY CODE], dbo.USERS.UserId AS [USER ID], dbo.SUBSCRIPTIONS.DESCRIPTION
FROM         dbo.USERS INNER JOIN
                      dbo.USERS AS USERS_1 ON dbo.USERS.PARENTID = USERS_1.UserId INNER JOIN
                      dbo.CASESTREE ON USERS_1.SUBSCRIPTIONID = dbo.CASESTREE.TREEID INNER JOIN
                      dbo.SUBSCRIPTIONS ON dbo.USERS.GROUPID = dbo.SUBSCRIPTIONS.SUBSCRIPTIONID
WHERE     (dbo.USERS.DepartmentID = 2) AND (dbo.CASESTREE.CATEGORYID = 1100)

GO
