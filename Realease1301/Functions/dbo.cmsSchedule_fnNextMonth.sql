SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION dbo.cmsSchedule_fnNextMonth 
(
    @DATESTART datetime,
    @JAN   bit,
    @FEB   bit,
    @MAR   bit,
    @APR   bit,
    @MAY   bit,
    @JUN   bit,
    @JUL   bit,
    @AUG   bit,
    @SEP   bit,
    @OCT   bit,
    @NOV   bit,
    @DEC   bit
)
RETURNS datetime
AS
BEGIN
    DECLARE @NEXT datetime
    DECLARE @MONTH integer
    DECLARE @MON integer
    DECLARE @MAX integer
    SET @MAX = 12
    SET @MON = 1
    WHILE @MON <= @MAX
    BEGIN
       SET @NEXT = DATEADD(month,@MON,@DATESTART)
       SET @MONTH = DATEPART(month,@NEXT) -- UPPER(SUBSTRING(DATENAME(month,@NEXT),1,3))
       IF @JAN = 1 AND @MONTH = 01 BREAK  -- 'JAN'
       IF @FEB = 1 AND @MONTH = 02 BREAK  -- 'FEB'
       IF @MAR = 1 AND @MONTH = 03 BREAK  -- 'MAR'
       IF @APR = 1 AND @MONTH = 04 BREAK  -- 'APR'
       IF @MAY = 1 AND @MONTH = 05 BREAK  -- 'MAY'
       IF @JUN = 1 AND @MONTH = 06 BREAK  -- 'JUN'
       IF @JUL = 1 AND @MONTH = 07 BREAK  -- 'JUL'
       IF @AUG = 1 AND @MONTH = 08 BREAK  -- 'AUG'
       IF @SEP = 1 AND @MONTH = 09 BREAK  -- 'SEP'
       IF @OCT = 1 AND @MONTH = 10 BREAK  -- 'OCT'
       IF @NOV = 1 AND @MONTH = 11 BREAK  -- 'NOV'
       IF @DEC = 1 AND @MONTH = 12 BREAK  -- 'DEC'
       SET @MON = @MON + 1
    END
    IF @MON > @MAX
    BEGIN
       SET @NEXT = @DATESTART /* nothing found, reset to today */
    END
    RETURN (@NEXT)
END
GO
