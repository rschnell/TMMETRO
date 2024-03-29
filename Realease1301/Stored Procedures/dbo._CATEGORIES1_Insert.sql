SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'CATEGORIES1' table.
CREATE PROCEDURE [dbo].[_CATEGORIES1_Insert]
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
	@TERMS nchar(10)
AS
	INSERT INTO [dbo].[CATEGORIES1]
	(
		[CATEGORYID],
		[TEMPLATEID],
		[CATNAME],
		[CATDESC],
		[CATOF],
		[CATOFFIELDNAME],
		[ATTNO],
		[ATTNAME1],
		[ATTNAME2],
		[ATTNAME3],
		[ATTNAME4],
		[ATTNAME5],
		[ACTIVE],
		[ATTRELNO],
		[ATTRELID],
		[RENDERTOLEVEL],
		[LEAFATLEVEL],
		[LANGUAGE],
		[TERMS]
	)
	VALUES
	(
		@CATEGORYID,
		@TEMPLATEID,
		@CATNAME,
		@CATDESC,
		@CATOF,
		@CATOFFIELDNAME,
		@ATTNO,
		@ATTNAME1,
		@ATTNAME2,
		@ATTNAME3,
		@ATTNAME4,
		@ATTNAME5,
		@ACTIVE,
		@ATTRELNO,
		@ATTRELID,
		@RENDERTOLEVEL,
		@LEAFATLEVEL,
		@LANGUAGE,
		@TERMS
	)
	SELECT @@IDENTITY
GO
