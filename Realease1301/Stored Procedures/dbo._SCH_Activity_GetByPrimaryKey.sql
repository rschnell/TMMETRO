SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SCH_Activity' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_Activity_GetByPrimaryKey]
	@ActivityID int
AS
	SELECT * FROM [dbo].[SCH_Activity] WHERE
		[ActivityID] = @ActivityID
GO
