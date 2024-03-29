SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CUSTOMERSXFACILITIES' table using the primary key value.
CREATE PROCEDURE [dbo].[_CUSTOMERSXFACILITIES_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CUSTOMERSXFACILITIES] WHERE
		[ID] = @ID
GO
