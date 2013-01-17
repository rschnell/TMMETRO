SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[ALLLEDGERVALUES]
AS
SELECT     dbo.SUBSCRIPTIONS.TMROLE, dbo.SUBSCRIPTIONS.DESCRIPTION, dbo.CASES.REFERENCE, dbo.rptLEDGER.UserId, ISNULL(dbo.rptLEDGER.CATNAME, 
                      N'OUTGOODS') AS CATNAME, dbo.rptLEDGER.NODENAME, dbo.rptLEDGER.TREELEVEL, dbo.rptLEDGER.ID, dbo.rptLEDGER.CASEID, dbo.rptLEDGER.ACTIONID, 
                      dbo.rptLEDGER.[Case Title], dbo.rptLEDGER.[Action Title], dbo.rptLEDGER.LEDGERVALUE, dbo.rptLEDGER.LEDGERDATE, dbo.rptLEDGER.[Raised By], 
                      dbo.rptLEDGER.[Updated Days], dbo.rptLEDGER.DayDate, dbo.rptLEDGER.DayTime, dbo.rptLEDGER.weekno, dbo.rptLEDGER.LEDGERDESCRIPTION, 
                      dbo.rptLEDGER.ValueFromDate, dbo.rptLEDGER.ValueToDate, dbo.rptLEDGER.City, dbo.rptLEDGER.Quantity, dbo.rptLEDGER.UnitValue, 
                      dbo.rptLEDGER.AssetDescription, dbo.rptLEDGER.Active, dbo.rptLEDGER.LEDGER, dbo.rptLEDGER.LOCATION1, dbo.rptLEDGER.LOCATION2, 
                      dbo.rptLEDGER.RATETYPE, dbo.rptLEDGER.DIARYID, dbo.rptLEDGER.CURRENCY, dbo.rptLEDGER.SUBSCRIPTIONID, dbo.rptLEDGER.VALUETYPE, 
                      dbo.rptLEDGER.LEDGERTYPE, dbo.rptLEDGER.CurrencyCode, dbo.rptLEDGER.Asset, dbo.rptLEDGER.Project, dbo.rptLEDGER.TREELN, dbo.rptLEDGER.TREERN, 
                      dbo.rptLEDGER.NODEVALUE, dbo.rptLEDGER.CurrencyRate, dbo.rptLEDGER.CurrencyPer, dbo.rptLEDGER.ASSETTYPE, dbo.rptLEDGER.IsRECOVERED, 
                      dbo.rptLEDGER.AssetClass
FROM         dbo.rptLEDGER LEFT OUTER JOIN
                      dbo.CASES ON dbo.rptLEDGER.CASEID = dbo.CASES.CASEID LEFT OUTER JOIN
                      dbo.SUBSCRIPTIONS ON dbo.CASES.SUBSCRIPTIONID = dbo.SUBSCRIPTIONS.SUBSCRIPTIONID




GO
