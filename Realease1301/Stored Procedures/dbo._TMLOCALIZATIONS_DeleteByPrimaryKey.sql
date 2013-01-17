SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'TMLOCALIZATIONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_TMLOCALIZATIONS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[TMLOCALIZATIONS] WHERE
		[ID] = @ID
GO
