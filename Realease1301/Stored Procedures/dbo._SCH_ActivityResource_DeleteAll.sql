SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'SCH_ActivityResource' table.
CREATE PROCEDURE [dbo].[_SCH_ActivityResource_DeleteAll]
AS
	DELETE FROM [dbo].[SCH_ActivityResource]
GO
