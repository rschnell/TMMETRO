SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[rptLEDGER]
AS
SELECT     TOP (100) PERCENT dbo.MyValues.UserId, dbo.CATEGORIES.CATNAME, dbo.CASESTREE.NODENAME, dbo.CASESTREE.TREELEVEL, dbo.MyValues.ID, 
                      dbo.MyValues.CASEID, dbo.MyValues.ACTIONID, dbo.MyValues.[Case Title], dbo.MyValues.[Action Title], dbo.MyValues.LEDGERVALUE, 
dbo.MyValues.LEDGERDATE, 
                      dbo.MyValues.[Raised By], dbo.MyValues.[Updated Days], dbo.MyValues.DayDate, dbo.MyValues.DayTime, dbo.MyValues.weekno, 
                      dbo.MyValues.LEDGERDESCRIPTION, dbo.MyValues.ValueFromDate, dbo.MyValues.ValueToDate, dbo.MyValues.City, dbo.MyValues.Quantity, 
                      dbo.MyValues.UnitValue, dbo.MyValues.AssetDescription, dbo.MyValues.Active, dbo.MyValues.LEDGER, dbo.MyValues.LOCATION1, dbo.MyValues.LOCATION2, 
                      dbo.MyValues.RATETYPE, dbo.MyValues.DIARYID, dbo.MyValues.CURRENCY, dbo.MyValues.SUBSCRIPTIONID, dbo.MyValues.VALUETYPE, 
                      dbo.MyValues.LEDGERTYPE, dbo.MyValues.CurrencyCode, dbo.MyValues.Asset, dbo.MyValues.Project, dbo.CASESTREE.TREELN, dbo.CASESTREE.TREERN, 
                      dbo.CASESTREE.NODEVALUE, dbo.MyValues.CurrencyRate, dbo.MyValues.CurrencyPer, dbo.MyValues.ASSETTYPE, dbo.MyValues.IsRECOVERED, 
                      dbo.MyValues.AssetClass
FROM         dbo.CATEGORIES RIGHT OUTER JOIN
                      dbo.CASESTREE ON dbo.CATEGORIES.CATEGORYID = dbo.CASESTREE.CATEGORYID RIGHT OUTER JOIN
                      dbo.MyValues ON dbo.CASESTREE.NODEVALUE = dbo.MyValues.LEDGERTYPE


GO
