SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'POIGALLERY' table using the primary key value.
CREATE PROCEDURE [dbo].[_POIGALLERY_DeleteByPrimaryKey]
	@GALLERYID int
AS
	DELETE FROM [dbo].[POIGALLERY] WHERE
		[GALLERYID] = @GALLERYID
GO
