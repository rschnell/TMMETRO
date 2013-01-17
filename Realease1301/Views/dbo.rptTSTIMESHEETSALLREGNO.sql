SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[rptTSTIMESHEETSALLREGNO]
AS
SELECT     dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.YEARMONTH, dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.Agency, 
                      dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.[License NO], CASE WHEN dbo.rptTSGroupByLicenseMonth.LOSSES IS NULL 
                      THEN 0 ELSE dbo.rptTSGroupByLicenseMonth.LOSSES END AS LOSSES, CASE WHEN dbo.rptTSGroupByLicenseMonth.RECOVERY IS NULL 
                      THEN 0 ELSE dbo.rptTSGroupByLicenseMonth.RECOVERY END AS RECOVERY, CASE WHEN dbo.rptTSGroupByLicenseMonth.PENALTIES IS NULL 
                      THEN 0 ELSE dbo.rptTSGroupByLicenseMonth.PENALTIES END AS PENALTIES, CASE WHEN dbo.rptTSGroupByLicenseMonth.Cases IS NULL 
                      THEN 0 ELSE dbo.rptTSGroupByLicenseMonth.Cases END AS CASES, dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.REGNO, 
                      dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.FACILITY AS STORE, dbo.rptTSGroupByLicenseMonth.YEARNO, 
                      dbo.rptTSGroupByLicenseMonth.MONTHNO, dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.COST, 
                      dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.HOURS, dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.RATE1PERHOUR
FROM         dbo.rptTSGroupByLicenseMonth INNER JOIN
                      dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO ON 
                      dbo.rptTSGroupByLicenseMonth.YEARMONTH = dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.YEARMONTH AND 
                      dbo.rptTSGroupByLicenseMonth.[License NO] = dbo.rptTSMYHOURVALUESREGNOGROUPENTRYNO.[License NO]

GO
