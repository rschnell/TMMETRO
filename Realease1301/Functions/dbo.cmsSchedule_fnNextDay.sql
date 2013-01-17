SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION dbo.cmsSchedule_fnNextDay 
(
    @DATESTART datetime,
    @SUN   bit,
    @MON   bit,
    @TUE   bit,
    @WED   bit,
    @THU   bit,
    @FRI   bit,
    @SAT   bit
)
RETURNS datetime
AS
BEGIN
    DECLARE @NOW datetime
    DECLARE @TODAY datetime
    DECLARE @NEXT datetime
    DECLARE @WEEKDAY integer
    DECLARE @DAY integer
    DECLARE @MAX integer
    SET @MAX = 7
    SET @DAY = 1
    SET @NOW = GETDATE()
    SET @TODAY = DATEADD(day,DATEDIFF(day,@DATESTART,@NOW),@DATESTART)
    IF @NOW < @TODAY
    BEGIN
       SET @DAY = 0  -- allow today if scheduled for later
    END
    IF @DATESTART < @TODAY
    BEGIN
       SET @DATESTART = @TODAY -- cannot backdate
    END
    WHILE @DAY <= @MAX
    BEGIN
       SET @NEXT = DATEADD(day,@DAY,@DATESTART)
       SET @WEEKDAY = DATEPART(weekday,@NEXT) -- UPPER(SUBSTRING(DATENAME(weekday,@NEXT),1,3))
       IF @SUN = 1 AND @WEEKDAY = 1 BREAK     -- 'SUN'
       IF @MON = 1 AND @WEEKDAY = 2 BREAK     -- 'MON'
       IF @TUE = 1 AND @WEEKDAY = 3 BREAK     -- 'TUE'
       IF @WED = 1 AND @WEEKDAY = 4 BREAK     -- 'WED'
       IF @THU = 1 AND @WEEKDAY = 5 BREAK     -- 'THU'
       IF @FRI = 1 AND @WEEKDAY = 6 BREAK     -- 'FRI'
       IF @SAT = 1 AND @WEEKDAY = 7 BREAK     -- 'SAT'
       SET @DAY = @DAY + 1
    END
    IF @DAY > @MAX
    BEGIN
       SET @NEXT = @DATESTART /* nothing found, reset to today */
    END
    RETURN (@NEXT)
END
GO
