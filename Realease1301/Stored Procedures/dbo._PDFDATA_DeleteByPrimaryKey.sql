SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'PDFDATA' table using the primary key value.
CREATE PROCEDURE [dbo].[_PDFDATA_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[PDFDATA] WHERE
		[ID] = @ID
GO
