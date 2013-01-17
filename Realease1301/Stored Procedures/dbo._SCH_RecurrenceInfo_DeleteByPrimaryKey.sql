SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SCH_RecurrenceInfo' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_RecurrenceInfo_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[SCH_RecurrenceInfo] WHERE
		[ID] = @ID
GO
