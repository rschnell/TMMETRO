SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'SCH_Activity' table.
CREATE PROCEDURE [dbo].[_SCH_Activity_DeleteAll]
AS
	DELETE FROM [dbo].[SCH_Activity]
GO
