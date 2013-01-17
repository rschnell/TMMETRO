SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'Configuration' table using the primary key value.
CREATE PROCEDURE [dbo].[_Configuration_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[Configuration] WHERE
		[ID] = @ID
GO
