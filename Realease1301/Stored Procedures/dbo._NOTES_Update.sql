SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'NOTES' table.
CREATE PROCEDURE [dbo].[_NOTES_Update]
	-- The rest of writeable parameters
	@TITLE nvarchar(70),
	@NOTESHTM nvarchar(max),
	@VERSION nvarchar(50),
	@LASTUPDATED datetime,
	@UPDATEDBY int,
	@PAGENO int,
	@CASEID int,
	@ACTIONID int,
	@NOTETYPE int,
	@CREATEDBY int,
	@CREATEDDATE datetime,
	@PERSONID int,
	@LISTID int,
	@ACTIVE bit,
	-- Primary key parameters
	@NOTESID int
AS
	UPDATE [dbo].[NOTES] SET
		[TITLE] = @TITLE,
		[NOTESHTM] = @NOTESHTM,
		[VERSION] = @VERSION,
		[LASTUPDATED] = @LASTUPDATED,
		[UPDATEDBY] = @UPDATEDBY,
		[PAGENO] = @PAGENO,
		[CASEID] = @CASEID,
		[ACTIONID] = @ACTIONID,
		[NOTETYPE] = @NOTETYPE,
		[CREATEDBY] = @CREATEDBY,
		[CREATEDDATE] = @CREATEDDATE,
		[PERSONID] = @PERSONID,
		[LISTID] = @LISTID,
		[ACTIVE] = @ACTIVE
	WHERE
		[NOTESID] = @NOTESID
GO
