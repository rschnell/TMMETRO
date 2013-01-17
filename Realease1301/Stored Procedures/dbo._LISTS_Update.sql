SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'LISTS' table.
CREATE PROCEDURE [dbo].[_LISTS_Update]
	-- The rest of writeable parameters
	@LASTUPDATED smalldatetime,
	@UPDATEDBY nvarchar(50),
	@CATEGORY nchar(15),
	@REFERENCE nchar(15),
	@LISTORDER int,
	@CHECKED bit,
	@TIMELINE datetime,
	@TITLE nvarchar(max),
	@QUESTION nvarchar(50),
	@ANSWER nvarchar(max),
	@COMMENT ntext,
	@CASEID nchar(10),
	@ACTIONID nchar(10),
	@ROWNO int,
	@SHEETNO int,
	@CUSTOM1 ntext,
	@CUSTOM2 ntext,
	@CUSTOM3 ntext,
	@DELFLAG bit,
	@TEMPLATEID int,
	-- Primary key parameters
	@LISTID int
AS
	UPDATE [dbo].[LISTS] SET
		[LASTUPDATED] = @LASTUPDATED,
		[UPDATEDBY] = @UPDATEDBY,
		[CATEGORY] = @CATEGORY,
		[REFERENCE] = @REFERENCE,
		[LISTORDER] = @LISTORDER,
		[CHECKED] = @CHECKED,
		[TIMELINE] = @TIMELINE,
		[TITLE] = @TITLE,
		[QUESTION] = @QUESTION,
		[ANSWER] = @ANSWER,
		[COMMENT] = @COMMENT,
		[CASEID] = @CASEID,
		[ACTIONID] = @ACTIONID,
		[ROWNO] = @ROWNO,
		[SHEETNO] = @SHEETNO,
		[CUSTOM1] = @CUSTOM1,
		[CUSTOM2] = @CUSTOM2,
		[CUSTOM3] = @CUSTOM3,
		[DELFLAG] = @DELFLAG,
		[TEMPLATEID] = @TEMPLATEID
	WHERE
		[LISTID] = @LISTID
GO
