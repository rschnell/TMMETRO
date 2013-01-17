SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'SCH_RecurrenceInfo' table.
CREATE PROCEDURE [dbo].[_SCH_RecurrenceInfo_GetAll]
AS
	SELECT * FROM [dbo].[SCH_RecurrenceInfo]
GO
