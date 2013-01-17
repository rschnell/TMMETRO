SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'POILOG' table using the primary key value.
CREATE PROCEDURE [dbo].[_POILOG_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[POILOG] WHERE
		[ID] = @ID
GO
