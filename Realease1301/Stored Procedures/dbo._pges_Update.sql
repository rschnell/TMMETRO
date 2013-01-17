SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'pges' table.
CREATE PROCEDURE [dbo].[_pges_Update]
	-- The rest of writeable parameters
	@PdfID int,
	@DocID int,
	@KeyID int,
	@PgeDate datetime,
	@PgeNumber int,
	@PgeImageType int,
	@PgeImageData image,
	-- Primary key parameters
	@PgeID int
AS
	UPDATE [dbo].[pges] SET
		[pdfID] = @PdfID,
		[docID] = @DocID,
		[keyID] = @KeyID,
		[pgeDate] = @PgeDate,
		[pgeNumber] = @PgeNumber,
		[pgeImageType] = @PgeImageType,
		[pgeImageData] = @PgeImageData
	WHERE
		[pgeID] = @PgeID
GO
