SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION dbo.cmsSchedule_fnDay 
(
    @DATESTART datetime,
    @DAYS varchar(200)
)
RETURNS datetime
AS
BEGIN
    DECLARE @NEXT datetime
    DECLARE @CHAR char(1)
    DECLARE @STRING varchar(200)
    DECLARE @NUMBER varchar(200)
    DECLARE @FINISH integer
    DECLARE @FIRST integer
    DECLARE @BEGIN integer
    DECLARE @INDEX integer
    DECLARE @END integer
    DECLARE @DAY integer
    DECLARE @THISDAY integer
    DECLARE @LASTDAY integer
    DECLARE @TIME time
    
    SET @THISDAY = DATEPART(day,@DATESTART)
    SET @LASTDAY = DATEPART(day,DATEADD(day,-@THISDAY,DATEADD(month,1,@DATESTART)))
    SET @NEXT = @DATESTART
    SET @STRING = ''
    SET @INDEX = 0
    SET @FIRST = 0
    SET @END = LEN(@DAYS)
    SET @TIME = CAST(@DATESTART as time)

    /* first, keep only valid characters */
    WHILE @INDEX <= @END
    BEGIN
       SET @INDEX = @INDEX + 1
       SET @CHAR = SUBSTRING(@DAYS,@INDEX,1)
       /* ascii('0') = 48, ascii('9') = 57, ascii(',') = 44, ascii('-') = 45 */
       IF (ASCII(@CHAR) >= 48 AND ASCII(@CHAR) <= 57)
       OR (ASCII(@CHAR) = 44)
       OR (ASCII(@CHAR) = 45)
       BEGIN
          SET @STRING = @STRING + @CHAR
       END
    END
    
    /* second, validate numbers */
    IF LEN(@STRING) > 0
    BEGIN
       WHILE @DATESTART = @NEXT
       BEGIN
          SET @STRING = @STRING + ','
          SET @STRING = REPLACE(@STRING,'-',',') /* ranges not supported yet */
          SET @STRING = REPLACE(@STRING,',,',',')
          SET @BEGIN = 1
          SET @END = 0
          SET @FINISH = LEN(@STRING)
          WHILE @END < @FINISH
          BEGIN
             SET @END = CHARINDEX(',',@STRING,@BEGIN)
             SET @NUMBER = SUBSTRING(@STRING,@BEGIN,(@END - @BEGIN))
             SET @BEGIN = @END + 1
             SET @DAY = CAST(@NUMBER as integer)
             IF @DAY > 0 AND @DAY <= @LASTDAY
             BEGIN
                IF @FIRST = 0
                BEGIN
                   SET @FIRST = @NUMBER
                END
                IF @DAY > @THISDAY
                BEGIN
                   SET @NEXT = @NUMBER + SPACE(1) + DATENAME(month,@DATESTART) + SPACE(1)
                             + CAST(DATEPART(year,@DATESTART) as char(4))
                             + SPACE(1) + CAST(@TIME as char(7))
                   BREAK
                END
             END
          END
          IF @DATESTART = @NEXT
          BEGIN
             /* when the next day cannot be found, get first day and increase month */
             SET @DATESTART = DATEADD(month,1,@DATESTART) /* here if next month is next year */
             SET @NEXT = CAST(@FIRST as varchar(2)) + SPACE(1) + DATENAME(month,@DATESTART) + SPACE(1)
                       + CAST(DATEPART(year,@DATESTART) as char(4))
                       + SPACE(1) + CAST(@TIME as char(7))
          END
       END
    END    
    RETURN (@NEXT)
END
GO
