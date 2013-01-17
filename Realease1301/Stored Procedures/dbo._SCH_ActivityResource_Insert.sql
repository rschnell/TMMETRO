SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'SCH_ActivityResource' table.
CREATE PROCEDURE [dbo].[_SCH_ActivityResource_Insert]
	@ActivityID int,
	@ResourceID int
AS
	INSERT INTO [dbo].[SCH_ActivityResource]
	(
		[ActivityID],
		[ResourceID]
	)
	VALUES
	(
		@ActivityID,
		@ResourceID
	)
	SELECT @@IDENTITY
GO
