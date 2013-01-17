SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'VALUES' table using the primary key value.
CREATE PROCEDURE [dbo].[_VALUES_DeleteByPrimaryKey]
	@VALUEID int
AS
	DELETE FROM [dbo].[VALUES] WHERE
		[VALUEID] = @VALUEID
GO
