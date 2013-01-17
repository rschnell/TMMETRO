SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'VALUES' table using the primary key value.
CREATE PROCEDURE [dbo].[_VALUES_GetByPrimaryKey]
	@VALUEID int
AS
	SELECT * FROM [dbo].[VALUES] WHERE
		[VALUEID] = @VALUEID
GO
