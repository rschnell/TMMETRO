SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SCH_Resource' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_Resource_GetByPrimaryKey]
	@ResourceID int
AS
	SELECT * FROM [dbo].[SCH_Resource] WHERE
		[ResourceID] = @ResourceID
GO
