SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CASESTREETERMS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESTREETERMS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[CASESTREETERMS] WHERE
		[ID] = @ID
GO
