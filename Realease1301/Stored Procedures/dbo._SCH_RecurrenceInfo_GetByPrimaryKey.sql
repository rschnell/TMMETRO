SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SCH_RecurrenceInfo' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_RecurrenceInfo_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[SCH_RecurrenceInfo] WHERE
		[ID] = @ID
GO
