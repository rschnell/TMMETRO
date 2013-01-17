SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'SCH_Resource' table.
CREATE PROCEDURE [dbo].[_SCH_Resource_DeleteAll]
AS
	DELETE FROM [dbo].[SCH_Resource]
GO
