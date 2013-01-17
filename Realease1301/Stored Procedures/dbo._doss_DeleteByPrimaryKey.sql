SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'doss' table using the primary key value.
CREATE PROCEDURE [dbo].[_doss_DeleteByPrimaryKey]
	@DosId int
AS
	DELETE FROM [dbo].[doss] WHERE
		[dosId] = @DosId
GO
