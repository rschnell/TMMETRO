SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'docs' table.
CREATE PROCEDURE [dbo].[_docs_Update]
	-- The rest of writeable parameters
	@PdfID int,
	@DocDate datetime,
	@DocStatus int,
	@DocSettings int,
	@DocXml ntext,
	@DocOutputData image,
	-- Primary key parameters
	@DocID int
AS
	UPDATE [dbo].[docs] SET
		[pdfID] = @PdfID,
		[docDate] = @DocDate,
		[docStatus] = @DocStatus,
		[docSettings] = @DocSettings,
		[docXml] = @DocXml,
		[docOutputData] = @DocOutputData
	WHERE
		[docID] = @DocID
GO
