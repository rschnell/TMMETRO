SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'PDFFORMS' table using the primary key value.
CREATE PROCEDURE [dbo].[_PDFFORMS_GetByPrimaryKey]
	@FORMID int
AS
	SELECT * FROM [dbo].[PDFFORMS] WHERE
		[FORMID] = @FORMID
GO
