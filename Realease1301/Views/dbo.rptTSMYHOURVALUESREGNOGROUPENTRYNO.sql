SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[rptTSMYHOURVALUESREGNOGROUPENTRYNO]
AS
SELECT     YEARMONTH, [License NO], SUM(HOURS * RATE1PERHOUR) AS COST, Agency, REGNO, FACILITY, SUM(HOURS) AS HOURS, RATE1PERHOUR
FROM         dbo.rptTSMyHourValuesREGNO
GROUP BY YEARMONTH, Agency, [License NO], REGNO, FACILITY, RATE1PERHOUR

GO
