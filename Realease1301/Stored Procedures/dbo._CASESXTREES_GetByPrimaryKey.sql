SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CASESXTREES' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESXTREES_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[CASESXTREES] WHERE
		[ID] = @ID
GO
