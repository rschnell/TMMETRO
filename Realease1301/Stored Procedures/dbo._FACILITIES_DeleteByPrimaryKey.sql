SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'FACILITIES' table using the primary key value.
CREATE PROCEDURE [dbo].[_FACILITIES_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[FACILITIES] WHERE
		[ID] = @ID
GO
