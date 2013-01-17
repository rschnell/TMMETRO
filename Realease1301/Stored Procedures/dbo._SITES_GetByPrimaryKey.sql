SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SITES' table using the primary key value.
CREATE PROCEDURE [dbo].[_SITES_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[SITES] WHERE
		[ID] = @ID
GO
