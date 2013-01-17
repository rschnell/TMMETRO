SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'DIARY' table.
CREATE PROCEDURE [dbo].[_DIARY_Insert]
	@NoteHTM nvarchar(max),
	@Note nvarchar(max),
	@CASEID int,
	@ACTIONID int,
	@IsDescription bit,
	@_CMSUSERSRAISED int,
	@_CMSDATEUPDATED datetime,
	@_CMSTYPEOF int,
	@Active bit,
	@CHANGETYPE nvarchar(255),
	@OLDVALUE nvarchar(255),
	@NEWVALUE nvarchar(255)
AS
	INSERT INTO [dbo].[DIARY]
	(
		[NoteHTM],
		[Note],
		[CASEID],
		[ACTIONID],
		[IsDescription],
		[_CMSUSERSRAISED],
		[_CMSDATEUPDATED],
		[_CMSTYPEOF],
		[Active],
		[CHANGETYPE],
		[OLDVALUE],
		[NEWVALUE]
	)
	VALUES
	(
		@NoteHTM,
		@Note,
		@CASEID,
		@ACTIONID,
		@IsDescription,
		@_CMSUSERSRAISED,
		@_CMSDATEUPDATED,
		@_CMSTYPEOF,
		@Active,
		@CHANGETYPE,
		@OLDVALUE,
		@NEWVALUE
	)
	SELECT @@IDENTITY
GO
