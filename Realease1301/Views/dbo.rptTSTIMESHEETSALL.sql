SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[rptTSTIMESHEETSALL]
AS
SELECT DISTINCT 
                      dbo.rptTSMYHOURVALUES.FACILITY, dbo.CASESTREETERMS.BASETERM + N' ' + dbo.rptTSMYHOURVALUES.FACILITY AS STORE, 
                      dbo.rptTSMYHOURVALUES.MONTHNO, dbo.rptTSMYHOURVALUES.YEARNO, dbo.rptTSMYHOURVALUES.RATE1PERHOUR, dbo.rptTSMYHOURVALUES.Agency, 
                      dbo.rptTSMYHOURVALUES.[License NO], dbo.rptTSGroupByLicenseMonth.Losses, dbo.rptTSGroupByLicenseMonth.Recovery, 
                      dbo.rptTSGroupByLicenseMonth.Penalties, dbo.rptTSGroupByLicenseMonth.Cases, 
                      dbo.rptTSMYHOURVALUES.HOURS * dbo.rptTSMYHOURVALUES.RATE1PERHOUR AS COST, dbo.rptTSMYHOURVALUES.HOURS
FROM         dbo.rptTSMYHOURVALUES LEFT OUTER JOIN
                      dbo.rptTSGroupByLicenseMonth ON dbo.rptTSMYHOURVALUES.[License NO] = dbo.rptTSGroupByLicenseMonth.[License NO] LEFT OUTER JOIN
                      dbo.CASESTREETERMS ON dbo.rptTSMYHOURVALUES.FACILITYID = dbo.CASESTREETERMS.TREEID
WHERE     (NOT (dbo.rptTSGroupByLicenseMonth.Losses IS NULL))

GO
