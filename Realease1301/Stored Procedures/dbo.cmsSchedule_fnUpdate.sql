SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsSchedule_fnUpdate 
(
    @ReportScheduleID integer,
    @UpdateStatus char(1)
)
AS
BEGIN
    DECLARE @NEXTRUN datetime
    DECLARE @LASTRUN datetime
    DECLARE @START datetime
    DECLARE @STOP datetime
    DECLARE @SCHEDULEEND bit
    DECLARE @INTERVAL char(1)
    DECLARE @INTERVALHOURREPEAT integer
    DECLARE @INTERVALDAYDAYS bit
    DECLARE @INTERVALDAYREPEAT bit
    DECLARE @INTERVALMONTHWEEK bit
    DECLARE @INTERVALMONTHDAY bit
    DECLARE @REPEATWEEKS integer
    DECLARE @REPEATDAYS integer
    DECLARE @REPEATHOURS integer
    DECLARE @REPEATMINUTES integer
    DECLARE @STARTHOURS integer
    DECLARE @STARTMINUTES integer
    DECLARE @SUN bit
    DECLARE @MON bit
    DECLARE @TUE bit
    DECLARE @WED bit
    DECLARE @THU bit
    DECLARE @FRI bit
    DECLARE @SAT bit
    DECLARE @JAN bit
    DECLARE @FEB bit
    DECLARE @MAR bit
    DECLARE @APR bit
    DECLARE @MAY bit
    DECLARE @JUN bit
    DECLARE @JUL bit
    DECLARE @AUG bit
    DECLARE @SEP bit
    DECLARE @OCT bit
    DECLARE @NOV bit
    DECLARE @DEC bit
    DECLARE @MONTH varchar(50)
    DECLARE @WEEK varchar(50)
    DECLARE @DAYS varchar(50)
    DECLARE @NOW datetime
    DECLARE @DATESTART datetime
    DECLARE @WEEKSTART datetime
    DECLARE @WEEKEND datetime
    DECLARE @SUNDAY datetime
    DECLARE @WEEKDAY integer
    DECLARE @DIFF integer
    DECLARE @TIMENOW time
    DECLARE @TIMESTART time

    SELECT @START=[START],
           @STOP=[STOP],
           @SCHEDULEEND=[SCHEDULEEND],
           @INTERVAL=[INTERVAL],
           @INTERVALHOURREPEAT=[INTERVALHOURREPEAT],
           @INTERVALDAYDAYS=[INTERVALDAYDAYS],
           @INTERVALDAYREPEAT=[INTERVALDAYREPEAT],
           @INTERVALMONTHWEEK=[INTERVALMONTHWEEK],
           @INTERVALMONTHDAY=[INTERVALMONTHDAY],
           @REPEATWEEKS=[REPEATWEEKS],
           @REPEATDAYS=[REPEATDAYS],
           @REPEATHOURS=[REPEATHOURS],
           @REPEATMINUTES=[REPEATMINUTES],
           @STARTHOURS=[STARTHOURS],
           @STARTMINUTES=[STARTMINUTES],
           @LASTRUN=[LASTRUN],
           @WEEK=[WEEK],
           @DAYS=[DAYS],
           @SUN=[SUN],
           @MON=[MON],
           @TUE=[TUE],
           @WED=[WED],
           @THU=[THU],
           @FRI=[FRI],
           @SAT=[SAT],
           @JAN=[JAN],
           @FEB=[FEB],
           @MAR=[MAR],
           @APR=[APR],
           @MAY=[MAY],
           @JUN=[JUN],
           @JUL=[JUL],
           @AUG=[AUG],
           @SEP=[SEP],
           @OCT=[OCT],
           @NOV=[NOV],
           @DEC=[DEC]
    FROM [REPORTSCHEDULES]
    WHERE [REPORTSCHEDULEID]=@ReportScheduleID
    
    SET @NOW = GETDATE()
    SET @DATESTART = CONVERT(date, @NOW)
    SET @TIMENOW = CONVERT(time, @NOW)
    -- get the start date
    IF @DATESTART < @START
    BEGIN
       SET @DATESTART = CONVERT(date, @START)
    END
    -- get the start time
    SET @TIMESTART = CONVERT(time, CAST(@STARTHOURS as varchar(2)) + ':' + CAST(@STARTMINUTES as varchar(2)) + ':00.00')
    -- next run initialised
    SET @NEXTRUN = CAST(CONVERT(varchar(11),@DATESTART,100) + SPACE(1) + CONVERT(varchar(5), @TIMESTART) AS datetime)
    --------------------------------------------------------------
    IF @INTERVAL = 'H'
    BEGIN
       IF @NEXTRUN <= @NOW
       BEGIN
          IF @REPEATHOURS > 0
          BEGIN
             SET @REPEATMINUTES = @REPEATMINUTES + (@REPEATHOURS * 60)
          END
          SET @NEXTRUN = DATEADD(minute,@REPEATMINUTES,@NOW)
       END
    END
    --------------------------------------------------------------
    IF @INTERVAL = 'D'
    BEGIN
       IF @INTERVALDAYDAYS > 0
       BEGIN
          SET @NEXTRUN = dbo.cmsSchedule_fnNextDay(@NEXTRUN,@SUN,@MON,@TUE,@WED,@THU,@FRI,@SAT)
       END
       IF @INTERVALDAYREPEAT > 0
       BEGIN
          IF @NEXTRUN <= @NOW
          BEGIN
             SET @NEXTRUN = DATEADD(day,@REPEATDAYS,@NEXTRUN)
          END
       END
    END
    --------------------------------------------------------------
    IF @INTERVAL = 'W'
    BEGIN
       IF @UpdateStatus = 'U'
       BEGIN -- Update schedule
          SET @REPEATWEEKS = 0 -- starting now
       END
       SET @WEEKDAY = DATEPART(weekday,@NEXTRUN)
       SET @SUNDAY = DATEADD(day,1 - @WEEKDAY,@NEXTRUN)
       SET @NEXTRUN = DATEADD(week,@REPEATWEEKS,@SUNDAY)
       SET @NEXTRUN = dbo.cmsSchedule_fnNextDay(@NEXTRUN,@SUN,@MON,@TUE,@WED,@THU,@FRI,@SAT)
    END
    --------------------------------------------------------------
    IF @INTERVAL = 'M'
    BEGIN
       IF @UpdateStatus = 'U'
       BEGIN -- Update schedule
          SET @NEXTRUN = DATEADD(month,-1,@NEXTRUN) -- starting now
       END
       WHILE @NEXTRUN <= @NOW
       BEGIN
          SET @NEXTRUN = dbo.cmsSchedule_fnNextMonth(@NEXTRUN,@JAN,@FEB,@MAR,@APR,@MAY,@JUN,@JUL,@AUG,@SEP,@OCT,@NOV,@DEC)
          SET @MONTH = DATENAME(month,@NEXTRUN) + SPACE(1) + CAST(YEAR(@NEXTRUN) AS varchar(4)) + SPACE(1) 
                     + CAST(@STARTHOURS as varchar(2)) + ':' + CAST(@STARTMINUTES as varchar(2)) + ':00.00'
          IF @INTERVALMONTHWEEK > 0
          BEGIN
             IF @WEEK = '1st' SET @WEEKSTART = '1 '  + @MONTH
             IF @WEEK = '2nd' SET @WEEKSTART = '8 '  + @MONTH
             IF @WEEK = '3rd' SET @WEEKSTART = '15 ' + @MONTH
             IF @WEEK = '4th' SET @WEEKSTART = '22 ' + @MONTH
             SET @WEEKEND = DATEADD(day,6,@WEEKSTART)
             IF @WEEK = 'Last'
             BEGIN
                IF DATEPART(month,@NEXTRUN) = 2
                BEGIN
                    SET @WEEKEND = '28 ' + @MONTH
                END
                IF DATEPART(month,@NEXTRUN) IN (1,3,5,7,8,10,12)
                BEGIN
                    SET @WEEKEND = '31 ' + @MONTH
                END
                IF DATEPART(month,@NEXTRUN) IN (4,6,9,11)
                BEGIN
                    SET @WEEKEND = '30 ' + @MONTH
                END
                /* SET @WEEKSTART = DATEADD(day,-(DATEPART(weekday,@WEEKEND)-1),@WEEKEND) */
                SET @WEEKSTART = DATEADD(day,-6,@WEEKEND)
             END
             SET @NEXTRUN = dbo.cmsSchedule_fnNextDay(@WEEKSTART,@SUN,@MON,@TUE,@WED,@THU,@FRI,@SAT)
             IF @NEXTRUN > @WEEKEND
             BEGIN
                SET @NOW = @NEXTRUN
             END
          END
          IF @INTERVALMONTHDAY > 0
          BEGIN
             /* SET @NEXTRUN = '1 ' + @MONTH */
             SET @NEXTRUN = dbo.cmsSchedule_fnDay(@NEXTRUN,@DAYS)
          END
       END
    END
    --------------------------------------------------------------
    IF @INTERVAL = 'O'
    BEGIN
       IF @UpdateStatus = 'N'
       BEGIN -- Next run
          SET @NEXTRUN = NULL
       END
       ELSE
       BEGIN -- Update schedule
          IF @NEXTRUN <= @NOW
          BEGIN
             IF @TIMESTART < @TIMENOW
             BEGIN
                SET @NEXTRUN = CAST(CONVERT(varchar(11),DATEADD(day, 1, @DATESTART),100) + SPACE(1) + CONVERT(varchar(5), @TIMESTART) AS datetime)
             END
             ELSE
             BEGIN
                SET @NEXTRUN = CAST(CONVERT(varchar(11),@DATESTART,100) + SPACE(1) + CONVERT(varchar(5), @TIMESTART) AS datetime)
             END
          END
       END
    END
    --------------------------------------------------------------
    IF @SCHEDULEEND = 1 AND @STOP < @NEXTRUN
    BEGIN
       SET @NEXTRUN = NULL
    END
    --------------------------------------------------------------
    IF @UpdateStatus = 'N'
    BEGIN -- Next run
       UPDATE [REPORTSCHEDULES]
         SET [NEXTRUN] = @NEXTRUN,
             [LASTRUN] = @NOW
       WHERE [REPORTSCHEDULEID] = @ReportScheduleID
    END
    ELSE
    BEGIN -- Update schedule
       UPDATE [REPORTSCHEDULES]
         SET [NEXTRUN] = @NEXTRUN,
             [UPDATED] = @NOW
       WHERE [REPORTSCHEDULEID] = @ReportScheduleID
    END
END
GO
