SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsGetScheduleStatus 
AS
SET NOCOUNT ON

DECLARE @ScheduleInterval integer
DECLARE @LastReport datetime
DECLARE @LastPause datetime
DECLARE @Now datetime
DECLARE @Pulse integer
DECLARE @ErrorDay integer
DECLARE @ErrorWeek integer
DECLARE @ErrorMonth integer
DECLARE @SentDay integer
DECLARE @SentWeek integer
DECLARE @SentMonth integer

SET @Now = GETDATE()
SET @ScheduleInterval = CAST((SELECT [VALUE] FROM [REPORTSCHEDULECONFIG] WHERE [NAME] = 'ScheduleInterval') AS integer)
SET @LastReport = ISNULL((SELECT MAX([LOGTIME]) FROM [REPORTSCHEDULELOGS] WHERE [REPORTSCHEDULEID] = 0
                                                                            AND [LOG] LIKE 'Get%'),@Now)
SET @LastPause =  ISNULL((SELECT MAX([LOGTIME]) FROM [REPORTSCHEDULELOGS] WHERE [REPORTSCHEDULEID] = 0
                                                                            AND [LOG] LIKE 'Schedule interval%'),@Now)
SET @ErrorDay =   ISNULL((SELECT COUNT(*) FROM [REPORTSCHEDULELOGS] WHERE [LOG] LIKE '%error %' 
                                                                      AND [LOGTIME] > DATEADD(Day,-1,@Now)),0)
SET @ErrorWeek =  ISNULL((SELECT COUNT(*) FROM [REPORTSCHEDULELOGS] WHERE [LOG] LIKE '%error %' 
                                                                      AND [LOGTIME] > DATEADD(Week,-1,@Now)),0)
SET @ErrorMonth = ISNULL((SELECT COUNT(*) FROM [REPORTSCHEDULELOGS] WHERE [LOG] LIKE '%error %' 
                                                                      AND [LOGTIME] > DATEADD(Month,-1,@Now)),0)
SET @SentDay =    ISNULL((SELECT COUNT(*) FROM [REPORTSCHEDULELOGS] WHERE [LOG] LIKE '%report sent' 
                                                                      AND [LOGTIME] > DATEADD(Day,-1,@Now)),0)
SET @SentWeek =   ISNULL((SELECT COUNT(*) FROM [REPORTSCHEDULELOGS] WHERE [LOG] LIKE '%report sent' 
                                                                      AND [LOGTIME] > DATEADD(Week,-1,@Now)),0)
SET @SentMonth =  ISNULL((SELECT COUNT(*) FROM [REPORTSCHEDULELOGS] WHERE [LOG] LIKE '%report sent' 
                                                                      AND [LOGTIME] > DATEADD(Month,-1,@Now)),0)
IF @LastReport > @LastPause
BEGIN
   SET @Pulse = DATEDIFF(millisecond, @LastReport, @Now)
END
ELSE
BEGIN
   SET @Pulse = DATEDIFF(millisecond, @LastPause, @Now)
END

SET @Pulse = @Pulse / @ScheduleInterval

SELECT @ScheduleInterval AS SCHEDULEINTERVAL,
       @LastReport AS LASTREPORT,
       @LastPause AS LASTPAUSE,
       @Pulse AS PULSE,
       @ErrorDay AS ERRORDAY,
       @ErrorWeek AS ERRORWEEK,
       @ErrorMonth AS ERRORMONTH,
       @SentDay AS SENTDAY,
       @SentWeek AS SENTWEEK,
       @SentMonth AS SENTMONTH

GO
