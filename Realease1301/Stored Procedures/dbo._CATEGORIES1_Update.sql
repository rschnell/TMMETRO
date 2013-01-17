SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'CATEGORIES1' table.
CREATE PROCEDURE [dbo].[_CATEGORIES1_Update]
	-- The rest of writeable parameters
	@CATEGORYID int,
	@TEMPLATEID int,
	@CATNAME nchar(20),
	@CATDESC nvarchar(max),
	@CATOF nchar(20),
	@CATOFFIELDNAME nchar(200),
	@ATTNO int,
	@ATTNAME1 nchar(50),
	@ATTNAME2 nchar(50),
	@ATTNAME3 nchar(50),
	@ATTNAME4 nchar(50),
	@ATTNAME5 nchar(50),
	@ACTIVE bit,
	@ATTRELNO int,
	@ATTRELID int,
	@RENDERTOLEVEL int,
	@LEAFATLEVEL int,
	@LANGUAGE nchar(10),
	@TERMS nchar(10),
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[CATEGORIES1] SET
		[CATEGORYID] = @CATEGORYID,
		[TEMPLATEID] = @TEMPLATEID,
		[CATNAME] = @CATNAME,
		[CATDESC] = @CATDESC,
		[CATOF] = @CATOF,
		[CATOFFIELDNAME] = @CATOFFIELDNAME,
		[ATTNO] = @ATTNO,
		[ATTNAME1] = @ATTNAME1,
		[ATTNAME2] = @ATTNAME2,
		[ATTNAME3] = @ATTNAME3,
		[ATTNAME4] = @ATTNAME4,
		[ATTNAME5] = @ATTNAME5,
		[ACTIVE] = @ACTIVE,
		[ATTRELNO] = @ATTRELNO,
		[ATTRELID] = @ATTRELID,
		[RENDERTOLEVEL] = @RENDERTOLEVEL,
		[LEAFATLEVEL] = @LEAFATLEVEL,
		[LANGUAGE] = @LANGUAGE,
		[TERMS] = @TERMS
	WHERE
		[ID] = @ID
GO
