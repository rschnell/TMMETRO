SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes all records from the 'SCH_RecurrenceInfo' table.
CREATE PROCEDURE [dbo].[_SCH_RecurrenceInfo_DeleteAll]
AS
	DELETE FROM [dbo].[SCH_RecurrenceInfo]
GO
