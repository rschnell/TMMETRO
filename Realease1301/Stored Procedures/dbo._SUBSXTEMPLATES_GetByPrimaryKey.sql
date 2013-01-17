SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SUBSXTEMPLATES' table using the primary key value.
CREATE PROCEDURE [dbo].[_SUBSXTEMPLATES_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[SUBSXTEMPLATES] WHERE
		[ID] = @ID
GO
