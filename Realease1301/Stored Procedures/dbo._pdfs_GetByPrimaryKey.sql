SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'pdfs' table using the primary key value.
CREATE PROCEDURE [dbo].[_pdfs_GetByPrimaryKey]
	@PdfID int
AS
	SELECT * FROM [dbo].[pdfs] WHERE
		[pdfID] = @PdfID
GO
