SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SCH_INVITEES' table using the primary key value.
CREATE PROCEDURE [dbo].[_SCH_INVITEES_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[SCH_INVITEES] WHERE
		[ID] = @ID
GO
