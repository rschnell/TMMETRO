SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'IMProviders' table using the primary key value.
CREATE PROCEDURE [dbo].[_IMProviders_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[IMProviders] WHERE
		[ID] = @ID
GO
