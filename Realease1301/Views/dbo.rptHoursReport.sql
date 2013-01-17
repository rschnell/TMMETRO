SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[rptHoursReport]
AS
SELECT     dbo.rptHrsActivity.ENTRYNO, dbo.rptHrsActivity.[Activity Date], dbo.rptHrsActivity.HOURS, dbo.rptHrsActivity.COMPANYCODE AS Code, dbo.rptHrsActivity.ACTIVE, 
                      dbo.rptHrsActivity.Agency, dbo.rptHrCountCases.CHARGED AS Charges, dbo.rptHrsActivity.[License NO], dbo.rptHrsActivity.Detective, 
                      dbo.rptHrsActivity.[Activity Description], dbo.rptHrsActivity.[Week No], dbo.rptHrsActivity.Year, dbo.rptHrsActivity.[Month No], 
dbo.rptHrsActivity.RATE1PERHOUR, 
                      dbo.rptHrsActivity.RATE2PERHOUR, dbo.rptHrsActivity.RATE3PERHOUR, dbo.rptHrsActivity.RATE4PERHOUR, dbo.rptHrsActivity.USERID, 
                      dbo.rptHrsActivity.[Recovered Value], dbo.rptHrsActivity.[Total Value]
FROM         dbo.rptHrsActivity INNER JOIN
                      dbo.rptHrCountCases ON dbo.rptHrsActivity.ENTRYNO = dbo.rptHrCountCases.ENTRYNO
WHERE     (dbo.rptHrsActivity.COMPANYCODE <> N'')

GO
