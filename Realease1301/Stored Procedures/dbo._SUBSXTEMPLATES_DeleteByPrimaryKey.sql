SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SUBSXTEMPLATES' table using the primary key value.
CREATE PROCEDURE [dbo].[_SUBSXTEMPLATES_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[SUBSXTEMPLATES] WHERE
		[ID] = @ID
GO
