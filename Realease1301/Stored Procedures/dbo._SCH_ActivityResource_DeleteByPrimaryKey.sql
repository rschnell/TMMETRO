SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SCH_ActivityResource' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_ActivityResource_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[SCH_ActivityResource] WHERE
		[ID] = @ID
GO
