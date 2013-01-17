SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CASESTREETERMS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESTREETERMS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CASESTREETERMS] WHERE
		[ID] = @ID
GO
