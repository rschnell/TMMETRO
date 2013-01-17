SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'IMProviders' table using the primary key value.
CREATE PROCEDURE [dbo].[_IMProviders_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[IMProviders] WHERE
		[ID] = @ID
GO
