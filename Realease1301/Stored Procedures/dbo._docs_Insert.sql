SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'docs' table.
CREATE PROCEDURE [dbo].[_docs_Insert]
	@PdfID int,
	@DocDate datetime,
	@DocStatus int,
	@DocSettings int,
	@DocXml ntext,
	@DocOutputData image
AS
	INSERT INTO [dbo].[docs]
	(
		[pdfID],
		[docDate],
		[docStatus],
		[docSettings],
		[docXml],
		[docOutputData]
	)
	VALUES
	(
		@PdfID,
		@DocDate,
		@DocStatus,
		@DocSettings,
		@DocXml,
		@DocOutputData
	)
	SELECT @@IDENTITY
GO
