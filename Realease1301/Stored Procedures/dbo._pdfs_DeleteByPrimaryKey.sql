SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'pdfs' table using the primary key value.
CREATE PROCEDURE [dbo].[_pdfs_DeleteByPrimaryKey]
	@PdfID int
AS
	DELETE FROM [dbo].[pdfs] WHERE
		[pdfID] = @PdfID
GO
