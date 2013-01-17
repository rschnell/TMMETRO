SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CASESXPERSONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESXPERSONS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CASESXPERSONS] WHERE
		[ID] = @ID
GO
