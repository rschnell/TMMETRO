SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'pdfs' table.
CREATE PROCEDURE [dbo].[_pdfs_Insert]
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
	@PdfText ntext
AS
	INSERT INTO [dbo].[pdfs]
	(
		[pdfDate],
		[pdfStatus],
		[pdfVersion],
		[pdfPageLoaded],
		[pdfPageCount],
		[pdfUserRights],
		[pdfDpi],
		[pdfDpiHigh],
		[pdfFilename],
		[pdfData],
		[pdfDataLength],
		[pdfDataHash],
		[pdfXml],
		[pdfText]
	)
	VALUES
	(
		@PdfDate,
		@PdfStatus,
		@PdfVersion,
		@PdfPageLoaded,
		@PdfPageCount,
		@PdfUserRights,
		@PdfDpi,
		@PdfDpiHigh,
		@PdfFilename,
		@PdfData,
		@PdfDataLength,
		@PdfDataHash,
		@PdfXml,
		@PdfText
	)
	SELECT @@IDENTITY
GO
