SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[cmsGetScheduleLog] 
AS
SET NOCOUNT ON

SELECT RS.[REPORTSCHEDULEID],
       R.[DESCRIPTION],
       (SELECT TOP 1 
        S.[DESCRIPTION]
        FROM [SUBSCRIPTIONS] AS S
        WHERE S.[SUBSCRIPTIONID] = RS.[SUBSCRIPTIONID]) AS [OWNER],
	   RL.[LOGTIME],
	   RL.[LOG]
  FROM [REPORTSCHEDULELOGS] AS RL
  INNER JOIN [REPORTSCHEDULES] AS RS ON RS.[REPORTSCHEDULEID] = RL.[REPORTSCHEDULEID]
  INNER JOIN [REPORTS] AS R ON R.[ID] = RS.[REPORTID]
  WHERE RL.[LOG] LIKE 'Report: %' OR RL.[LOG] LIKE 'Error %' OR RL.[LOG] LIKE 'Warning%'
  ORDER BY RL.[LOGTIME] DESC

GO
