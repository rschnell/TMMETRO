SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SCH_INVITEES' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_INVITEES_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[SCH_INVITEES] WHERE
		[ID] = @ID
GO
