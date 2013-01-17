SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsGetScheduleNext 
AS
SET NOCOUNT ON
------------------------------------------------------------------
DECLARE @NOW datetime
DECLARE @TODAY date
SET @NOW = GETDATE()
SET @TODAY = CONVERT(date, @NOW)

CREATE TABLE #_SELECTED_REPORT ([REPORTSCHEDULEID] integer,
                                [REPORTID] integer,
                                [SUBSCRIPTIONID] integer,
                                [START] date,
                                [STOP] date,
                                [INTERVAL] char(1),
                                [STARTHOURS] integer,
                                [STARTMINUTES] integer,
                                [RENDER] varchar(10),
                                [LASTRUN] datetime,
                                [NEXTRUN] datetime)

INSERT INTO #_SELECTED_REPORT
SELECT S.[REPORTSCHEDULEID],
       S.[REPORTID],
       S.[SUBSCRIPTIONID],
       S.[START],
       S.[STOP],
       S.[INTERVAL],
       S.[STARTHOURS],
       S.[STARTMINUTES],
       S.[RENDER],
       S.[LASTRUN],
       S.[NEXTRUN]
  FROM [REPORTS] AS R
 INNER JOIN [REPORTSCHEDULES] AS S ON S.[REPORTID] = R.[ID]
 WHERE (R.[ACTIVE] = 1)
   AND (S.[NEXTRUN] <= @NOW)
   AND (S.[NEXTRUN] > S.[LASTRUN] OR S.[LASTRUN] IS NULL)
   AND (S.[START] <= @TODAY OR S.[START] IS NULL)
   AND (S.[SCHEDULEEND] = 0 OR (S.[SCHEDULEEND] > 0 AND (S.[STOP] >= @TODAY OR S.[STOP] IS NULL)))
   AND ((S.[STARTHOURS] * 60) + S.[STARTMINUTES]) <= ((DATEPART(hour,@NOW) * 60) + DATEPART(minute,@NOW))
  
------------------------------------------------------------------
--  
-- calculate next run
--
DECLARE @ID INTEGER
DECLARE @INTERVAL CHAR(1)
DECLARE @STARTHOURS INTEGER
DECLARE @STARTMINUTES INTEGER

DECLARE curRUN CURSOR FOR SELECT [REPORTSCHEDULEID]
                            FROM #_SELECTED_REPORT
                           ORDER BY [NEXTRUN]
OPEN curRUN
FETCH NEXT FROM curRUN INTO @ID
WHILE @@FETCH_STATUS = 0
BEGIN
   EXECUTE cmsSchedule_fnUpdate @ID, 'N'
   FETCH NEXT FROM curRUN INTO @ID
END
CLOSE curRUN
DEALLOCATE curRUN
------------------------------------------------------------------
--
-- return list of reports
--
SELECT R.[NAME] AS [REPORT],
       R.[DESCRIPTION],
       R.[ID] AS [REPORTID],
       S.[REPORTSCHEDULEID],
       S.[SUBSCRIPTIONID],
       S.[RENDER]
  FROM #_SELECTED_REPORT AS SR
 INNER JOIN [REPORTS] AS R ON R.[ID] = SR.[REPORTID]
 INNER JOIN [REPORTSCHEDULES] AS S ON S.[REPORTSCHEDULEID] = SR.[REPORTSCHEDULEID]
 ORDER BY S.[NEXTRUN]
  
DROP TABLE #_SELECTED_REPORT

GO
