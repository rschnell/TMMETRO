SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[TSMyValues]
AS
SELECT     TOP (100) PERCENT dbo.LEDGERVALUES.VALUEID AS ID, dbo.DIARY.CASEID, dbo.DIARY.ACTIONID, dbo.CASES.TITLE AS [Case Title], 
                      dbo.ACTIONS.TITLE AS [Action Title], dbo.LEDGERVALUES.TotalValue AS LEDGERVALUE, dbo.LEDGERVALUES.ValueDate AS LEDGERDATE, 
                      dbo.USERS.UserName AS [Raised By], CASE WHEN dbo.Cases._CMSDATEUPDATED IS NULL THEN 9999 ELSE DATEDIFF(DAY, GetDate(), 
                      dbo.Cases._CMSDATEUPDATED) END AS [Updated Days], dbo.USERS.UserId, LTRIM(CONVERT(varchar, dbo.LEDGERVALUES.ValueDate, 101)) AS DayDate, 
                      LEFT(LTRIM(CONVERT(varchar, dbo.LEDGERVALUES.ValueDate, 108)), 5) AS DayTime, DATEPART(wk, dbo.LEDGERVALUES.ValueDate) AS weekno, 
                      dbo.LEDGERVALUES.Description AS LEDGERDESCRIPTION, dbo.LEDGERVALUES.ValueFromDate, dbo.LEDGERVALUES.ValueToDate, dbo.LEDGERVALUES.City, 
                      dbo.LEDGERVALUES.Quantity, dbo.LEDGERVALUES.UnitValue, dbo.LEDGERVALUES.AssetDescription, dbo.LEDGERVALUES.Active, 
                      CASE WHEN CASESTREE_1.NODENAME = 'NA' THEN 'OUTGOODS' ELSE CASESTREE_1.NODENAME END AS LEDGER, CASESTREE_3.NODENAME AS LOCATION1, 
                      CASESTREE_4.NODENAME AS LOCATION2, CASESTREE_5.NODENAME AS RATETYPE, dbo.DIARY.DIARYID, CASESTREE_6.NODENAME AS CURRENCY, 
                      dbo.CASES.SUBSCRIPTIONID, CASESTREE_2.NODENAME AS VALUETYPE, dbo.LEDGERVALUES.ValueTypeID AS LEDGERTYPE, dbo.LEDGERVALUES.CurrencyCode, 
                      CASESTREE_8.NODENAME AS Asset, CASESTREE_7.NODENAME AS Project, dbo.LEDGERVALUES.CurrencyRate, dbo.LEDGERVALUES.CurrencyPer, 
                      dbo.CASESTREE.NODENAME AS ASSETTYPE, dbo.LEDGERVALUES.IsRECOVERED, dbo.LEDGERVALUES.AssetClass, dbo.LEDGERVALUES.AssetTypeId
FROM         dbo.CASESTREE AS CASESTREE_6 RIGHT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_8 RIGHT OUTER JOIN
                      dbo.DIARY INNER JOIN
                      dbo.LEDGERVALUES ON dbo.DIARY.DIARYID = dbo.LEDGERVALUES.DiaryID INNER JOIN
                      dbo.USERS ON dbo.DIARY._CMSUSERSRAISED = dbo.USERS.UserId INNER JOIN
                      dbo.CASES ON dbo.DIARY.CASEID = dbo.CASES.CASEID LEFT OUTER JOIN
                      dbo.CASESTREE ON dbo.LEDGERVALUES.AssetTypeId = dbo.CASESTREE.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_1 ON dbo.LEDGERVALUES.ValueTypeID = CASESTREE_1.NODEVALUE ON 
                      CASESTREE_8.CATEGORYID = dbo.LEDGERVALUES.AssetTypeId LEFT OUTER JOIN
                      dbo.ACTIONS ON dbo.DIARY.ACTIONID = dbo.ACTIONS.ACTIONID LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_7 ON dbo.CASES._CMSPROJECTCONTAINS = CASESTREE_7.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_2 ON dbo.LEDGERVALUES.VALUEID = CASESTREE_2.NODEVALUE ON 
                      CASESTREE_6.NODEVALUE = dbo.LEDGERVALUES.CurrencyTypeID LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_5 ON dbo.LEDGERVALUES.RateTypeId = CASESTREE_5.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_4 ON dbo.LEDGERVALUES.Location2TypeId = CASESTREE_4.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_3 ON dbo.LEDGERVALUES.GroupID = CASESTREE_3.NODEVALUE
ORDER BY ID DESC

GO
