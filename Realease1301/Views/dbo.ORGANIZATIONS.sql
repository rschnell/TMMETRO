SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ORGANIZATIONS]
AS
SELECT SUBSTRING(dbo.SUBSCRIPTIONS.TMROLE, 1, CHARINDEX('.', dbo.SUBSCRIPTIONS.TMROLE) - 1) AS COMPANY, RIGHT(dbo.SUBSCRIPTIONS.TMSUBNAME, 2) AS COUNTRYCODE, 
               dbo.COUNTRIES.COUNTRY_NAME, dbo.SUBSCRIPTIONS.TMROLE, dbo.CASESTREE.NODENAME, dbo.CASESTREE.NODEVALUE, dbo.CASESTREE.NODETEXT, dbo.CASESTREE.TREELN, 
               dbo.CASESTREE.TREERN, dbo.CASESTREE.NODETAG, dbo.SUBSCRIPTIONS.SUBSCRIPTIONID, dbo.CASESTREE.NODEID, dbo.CASESTREE.PARENTID, dbo.SUBSCRIPTIONS.SITECODE, 
               dbo.CountFacilitiesBYCompanyCode.NOFACILITIES, dbo.SUBSCRIPTIONS.ACTIVE
FROM  dbo.SUBSCRIPTIONS INNER JOIN
               dbo.COUNTRIES ON RIGHT(dbo.SUBSCRIPTIONS.TMROLE, 2) = LEFT(dbo.COUNTRIES.COUNTRYCODE, 2) INNER JOIN
               dbo.CASESTREE ON dbo.SUBSCRIPTIONS.SUBSCRIPTIONID = dbo.CASESTREE.NODEVALUE INNER JOIN
               dbo.CountFacilitiesBYCompanyCode ON dbo.CASESTREE.NODETEXT = dbo.CountFacilitiesBYCompanyCode.[COMPANY CODE]
WHERE (dbo.SUBSCRIPTIONS.TMROLE <> 'Help') AND (dbo.SUBSCRIPTIONS.SUBSCRIPTIONID <> 0)

GO