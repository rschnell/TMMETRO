SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'CABINET' table.
CREATE PROCEDURE [dbo].[_CABINET_Insert]
	@TITLE nvarchar(200),
	@DESCRIPTION nvarchar(70),
	@CONTENTID int,
	@ITEMTYPE nchar(16),
	@CASEID int,
	@ACTIONID int,
	@ITEMSUBTYPE nchar(16),
	@ITEMTYPENO int,
	@ITEMSUBTYPENO int,
	@PARENTID int,
	@LASTUPDATED datetime,
	@UPDATEDBY nvarchar(70),
	@CREATED datetime,
	@CREATEDBY nvarchar(70),
	@ACTIVE bit,
	@LISTORDER int,
	@CREATEDBYUSERID int,
	@UPDATEDBYUSERID int,
	@PRIVACYID int,
	@PRIVACY nchar(10),
	@IsPrivate bit
AS
	INSERT INTO [dbo].[CABINET]
	(
		[TITLE],
		[DESCRIPTION],
		[CONTENTID],
		[ITEMTYPE],
		[CASEID],
		[ACTIONID],
		[ITEMSUBTYPE],
		[ITEMTYPENO],
		[ITEMSUBTYPENO],
		[PARENTID],
		[LASTUPDATED],
		[UPDATEDBY],
		[CREATED],
		[CREATEDBY],
		[ACTIVE],
		[LISTORDER],
		[CREATEDBYUSERID],
		[UPDATEDBYUSERID],
		[PRIVACYID],
		[PRIVACY],
		[IsPrivate]
	)
	VALUES
	(
		@TITLE,
		@DESCRIPTION,
		@CONTENTID,
		@ITEMTYPE,
		@CASEID,
		@ACTIONID,
		@ITEMSUBTYPE,
		@ITEMTYPENO,
		@ITEMSUBTYPENO,
		@PARENTID,
		@LASTUPDATED,
		@UPDATEDBY,
		@CREATED,
		@CREATEDBY,
		@ACTIVE,
		@LISTORDER,
		@CREATEDBYUSERID,
		@UPDATEDBYUSERID,
		@PRIVACYID,
		@PRIVACY,
		@IsPrivate
	)
	SELECT @@IDENTITY
GO