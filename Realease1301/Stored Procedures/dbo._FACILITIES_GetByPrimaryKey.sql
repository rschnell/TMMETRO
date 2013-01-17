SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'FACILITIES' table using the primary key value.
CREATE PROCEDURE [dbo].[_FACILITIES_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[FACILITIES] WHERE
		[ID] = @ID
GO
