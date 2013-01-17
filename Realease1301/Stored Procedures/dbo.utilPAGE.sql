SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 
CREATE PROCEDURE [dbo].[utilPAGE]
  @datasrc nvarchar(200)
 ,@orderBy nvarchar(200)
 ,@fieldlist nvarchar(200) = '*'
 ,@filter nvarchar(200) = ''
 ,@pageNum int = 1
 ,@pageSize int = NULL
AS
  SET NOCOUNT ON
  DECLARE
     @STMT nvarchar(max)         -- SQL to execute
    ,@recct int                  -- total # of records (for GridView paging interface)

  IF LTRIM(RTRIM(@filter)) = '' SET @filter = '1 = 1'
  IF @pageSize IS NULL BEGIN
    SET @STMT =  'SELECT   ' + @fieldlist + 
                 'FROM     ' + @datasrc +
                 'WHERE    ' + @filter + 
                 'ORDER BY ' + @orderBy
    EXEC (@STMT)                 -- return requested records 
  END ELSE BEGIN
    SET @STMT =  'SELECT   @recct = COUNT(*)
                  FROM     ' + @datasrc + '
                  WHERE    ' + @filter
    EXEC sp_executeSQL @STMT, @params = N'@recct INT OUTPUT', @recct = @recct OUTPUT
    SELECT @recct AS recct       -- return the total # of records

    DECLARE
      @lbound int,
      @ubound int

    SET @pageNum = ABS(@pageNum)
    SET @pageSize = ABS(@pageSize)
    IF @pageNum < 1 SET @pageNum = 1
    IF @pageSize < 1 SET @pageSize = 1
    SET @lbound = ((@pageNum - 1) * @pageSize)
    SET @ubound = @lbound + @pageSize + 1
    IF @lbound >= @recct BEGIN
      SET @ubound = @recct + 1
      SET @lbound = @ubound - (@pageSize + 1) -- return the last page of records if                                               -- no records would be on the
                                              -- specified page
    END
    SET @STMT =  'SELECT  ' + @fieldlist + '
                  FROM    (
                            SELECT  ROW_NUMBER() OVER(ORDER BY ' + @orderBy + ') AS row, *
                            FROM    ' + @datasrc + '
                            WHERE   ' + @filter + '
                          ) AS tbl
                  WHERE
                          row > ' + CONVERT(varchar(9), @lbound) + ' AND
                          row < ' + CONVERT(varchar(9), @ubound)
    EXEC (@STMT)                 -- return requested records 
  END
GO
