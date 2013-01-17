SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CASESXUSERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESXUSERS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CASESXUSERS] WHERE
		[ID] = @ID
GO
