SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[FUNGROUPCASES]
AS
SELECT     dbo.rptCASESMETROB.[REGION NAME] AS REGION, dbo.rptCASESMETROB.COMPANY, dbo.rptCASESMETROB.[Country Name] AS COUNTRY, 
                      COUNT(DISTINCT dbo.rptCASESMETROB.CASEID) AS NOCASES, COUNT(DISTINCT dbo.rptCASESMETROB.Facility) AS FACILITIESACTIVE, 
                      COUNT(DISTINCT dbo.rptCASESMETROB.[Raised By]) AS USERSACTIVE, SUM(dbo.rptCASESMETROB.[Total Loss]) AS LOSSES, 
                      dbo.CountUsersBYCompanyCode.NOUSERS AS USERS, dbo.CountFacilitiesBYCompanyCode.NOFACILITIES AS FACILITIES, DATEDIFF(d, 
                      MIN(dbo.rptCASESMETROB.[Date Raised]), GETDATE()) AS DAYS, dbo.rptCASESMETROB.[COMPANY CODE], MIN(dbo.rptCASESMETROB.[Date Raised]) AS RAISED, 
                      CONVERT(VARCHAR(12), MIN(dbo.rptCASESMETROB.[Date Raised]), 107) AS FIRSTRAISED
FROM         dbo.rptCASESMETROB INNER JOIN
                      dbo.CountUsersBYCompanyCode ON dbo.rptCASESMETROB.[COMPANY CODE] = dbo.CountUsersBYCompanyCode.CodeOrganization INNER JOIN
                      dbo.CountFacilitiesBYCompanyCode ON dbo.rptCASESMETROB.[COMPANY CODE] = dbo.CountFacilitiesBYCompanyCode.[COMPANY CODE]
GROUP BY dbo.rptCASESMETROB.COMPANY, dbo.rptCASESMETROB.[Country Name], dbo.CountUsersBYCompanyCode.NOUSERS, 
                      dbo.CountFacilitiesBYCompanyCode.NOFACILITIES, dbo.rptCASESMETROB.[COMPANY CODE], dbo.rptCASESMETROB.[REGION NAME]


GO
