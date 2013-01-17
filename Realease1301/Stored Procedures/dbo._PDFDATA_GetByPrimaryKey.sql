SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'PDFDATA' table using the primary key value.
CREATE PROCEDURE [dbo].[_PDFDATA_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[PDFDATA] WHERE
		[ID] = @ID
GO
