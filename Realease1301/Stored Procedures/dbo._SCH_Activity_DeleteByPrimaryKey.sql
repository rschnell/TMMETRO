SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SCH_Activity' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_Activity_DeleteByPrimaryKey]
	@ActivityID int
AS
	DELETE FROM [dbo].[SCH_Activity] WHERE
		[ActivityID] = @ActivityID
GO
