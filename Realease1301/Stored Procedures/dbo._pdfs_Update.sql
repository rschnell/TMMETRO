SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'pdfs' table.
CREATE PROCEDURE [dbo].[_pdfs_Update]
	-- The rest of writeable parameters
	@PdfDate datetime,
	@PdfStatus int,
	@PdfVersion int,
	@PdfPageLoaded int,
	@PdfPageCount int,
	@PdfUserRights int,
	@PdfDpi int,
	@PdfDpiHigh int,
	@PdfFilename nvarchar(200),
	@PdfData image,
	@PdfDataLength int,
	@PdfDataHash binary(64),
	@PdfXml ntext,
	@PdfText ntext,
	-- Primary key parameters
	@PdfID int
AS
	UPDATE [dbo].[pdfs] SET
		[pdfDate] = @PdfDate,
		[pdfStatus] = @PdfStatus,
		[pdfVersion] = @PdfVersion,
		[pdfPageLoaded] = @PdfPageLoaded,
		[pdfPageCount] = @PdfPageCount,
		[pdfUserRights] = @PdfUserRights,
		[pdfDpi] = @PdfDpi,
		[pdfDpiHigh] = @PdfDpiHigh,
		[pdfFilename] = @PdfFilename,
		[pdfData] = @PdfData,
		[pdfDataLength] = @PdfDataLength,
		[pdfDataHash] = @PdfDataHash,
		[pdfXml] = @PdfXml,
		[pdfText] = @PdfText
	WHERE
		[pdfID] = @PdfID
GO
