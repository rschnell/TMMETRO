SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CASESXPERSONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESXPERSONS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[CASESXPERSONS] WHERE
		[ID] = @ID
GO
