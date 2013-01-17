SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'TMLOCALIZATIONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_TMLOCALIZATIONS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[TMLOCALIZATIONS] WHERE
		[ID] = @ID
GO
