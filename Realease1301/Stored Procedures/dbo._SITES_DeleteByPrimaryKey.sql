SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SITES' table using the primary key value.
CREATE PROCEDURE [dbo].[_SITES_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[SITES] WHERE
		[ID] = @ID
GO
