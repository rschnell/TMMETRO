SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'DIARY' table.
CREATE PROCEDURE [dbo].[_DIARY_Update]
	-- The rest of writeable parameters
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
	@NEWVALUE nvarchar(255),
	-- Primary key parameters
	@DIARYID int
AS
	UPDATE [dbo].[DIARY] SET
		[NoteHTM] = @NoteHTM,
		[Note] = @Note,
		[CASEID] = @CASEID,
		[ACTIONID] = @ACTIONID,
		[IsDescription] = @IsDescription,
		[_CMSUSERSRAISED] = @_CMSUSERSRAISED,
		[_CMSDATEUPDATED] = @_CMSDATEUPDATED,
		[_CMSTYPEOF] = @_CMSTYPEOF,
		[Active] = @Active,
		[CHANGETYPE] = @CHANGETYPE,
		[OLDVALUE] = @OLDVALUE,
		[NEWVALUE] = @NEWVALUE
	WHERE
		[DIARYID] = @DIARYID
GO
