SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'TEMPLATESBASE' table using the primary key value.
CREATE PROCEDURE [dbo].[_TEMPLATESBASE_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[TEMPLATESBASE] WHERE
		[ID] = @ID
GO
