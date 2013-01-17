SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'pdfs' table.
CREATE PROCEDURE [dbo].[_pdfs_GetAll]
AS
	SELECT * FROM [dbo].[pdfs]
GO
