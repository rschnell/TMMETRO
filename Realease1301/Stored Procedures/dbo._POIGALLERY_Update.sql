SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'POIGALLERY' table.
CREATE PROCEDURE [dbo].[_POIGALLERY_Update]
	-- The rest of writeable parameters
	@ID uniqueidentifier,
	@PERSONID int,
	@SUBSCRIPTIONID int,
	@CASEID int,
	@ACTIONID int,
	@PICTURE varbinary(max),
	@UPDATED datetime,
	@UPDATEDBY int,
	@TITLE nvarchar(50),
	@DESCRIPTION nvarchar(50),
	@DATETAKEN datetime,
	@PICTYPE int,
	@EXT nchar(10),
	-- Primary key parameters
	@GALLERYID int
AS
	UPDATE [dbo].[POIGALLERY] SET
		[ID] = @ID,
		[PERSONID] = @PERSONID,
		[SUBSCRIPTIONID] = @SUBSCRIPTIONID,
		[CASEID] = @CASEID,
		[ACTIONID] = @ACTIONID,
		[PICTURE] = @PICTURE,
		[UPDATED] = @UPDATED,
		[UPDATEDBY] = @UPDATEDBY,
		[TITLE] = @TITLE,
		[DESCRIPTION] = @DESCRIPTION,
		[DATETAKEN] = @DATETAKEN,
		[PICTYPE] = @PICTYPE,
		[EXT] = @EXT
	WHERE
		[GALLERYID] = @GALLERYID
GO
