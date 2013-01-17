SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SCH_ActivityResource' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_ActivityResource_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[SCH_ActivityResource] WHERE
		[ID] = @ID
GO
