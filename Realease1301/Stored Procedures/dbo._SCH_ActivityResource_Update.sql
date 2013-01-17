SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'SCH_ActivityResource' table.
CREATE PROCEDURE [dbo].[_SCH_ActivityResource_Update]
	-- The rest of writeable parameters
	@ActivityID int,
	@ResourceID int,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[SCH_ActivityResource] SET
		[ActivityID] = @ActivityID,
		[ResourceID] = @ResourceID
	WHERE
		[ID] = @ID
GO
