SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CUSTOMERSXUSERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CUSTOMERSXUSERS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[CUSTOMERSXUSERS] WHERE
		[ID] = @ID
GO
