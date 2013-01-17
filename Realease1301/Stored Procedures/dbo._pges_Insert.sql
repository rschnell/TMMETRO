SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'pges' table.
CREATE PROCEDURE [dbo].[_pges_Insert]
	@PdfID int,
	@DocID int,
	@KeyID int,
	@PgeDate datetime,
	@PgeNumber int,
	@PgeImageType int,
	@PgeImageData image
AS
	INSERT INTO [dbo].[pges]
	(
		[pdfID],
		[docID],
		[keyID],
		[pgeDate],
		[pgeNumber],
		[pgeImageType],
		[pgeImageData]
	)
	VALUES
	(
		@PdfID,
		@DocID,
		@KeyID,
		@PgeDate,
		@PgeNumber,
		@PgeImageType,
		@PgeImageData
	)
	SELECT @@IDENTITY
GO
