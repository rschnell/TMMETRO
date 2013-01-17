SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'PDFFORMS' table using the primary key value.
CREATE PROCEDURE [dbo].[_PDFFORMS_DeleteByPrimaryKey]
	@FORMID int
AS
	DELETE FROM [dbo].[PDFFORMS] WHERE
		[FORMID] = @FORMID
GO
