SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[rptHrsActivity]
AS
SELECT     ENTRYNO, COMPANYNAME AS Agency, [License NO], Detective, HOURS, [Activity Description], [Cost Type], HOURSTYPE, [Week No], Year, [Month No], UserName, 
                      [Recovered Value], [Total Value], USERID, COMPANYCODE, CASEID, [Activity Date], ACTIVE, RATE1PERHOUR, RATE2PERHOUR, RATE3PERHOUR, 
                      RATE4PERHOUR
FROM         dbo.rptTIMESHEETS
WHERE     (CASEID IS NULL) AND (NOT (Detective IS NULL))


GO
