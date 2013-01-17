SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'pdfs' table.
CREATE PROCEDURE [dbo].[_pdfs_DeleteAll]
AS
	DELETE FROM [dbo].[pdfs]
GO
