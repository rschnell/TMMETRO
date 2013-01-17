SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SCH_Resource' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_Resource_DeleteByPrimaryKey]
	@ResourceID int
AS
	DELETE FROM [dbo].[SCH_Resource] WHERE
		[ResourceID] = @ResourceID
GO
