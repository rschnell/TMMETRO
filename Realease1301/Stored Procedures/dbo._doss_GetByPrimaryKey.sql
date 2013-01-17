SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'doss' table using the primary key value.
CREATE PROCEDURE [dbo].[_doss_GetByPrimaryKey]
	@DosId int
AS
	SELECT * FROM [dbo].[doss] WHERE
		[dosId] = @DosId
GO
