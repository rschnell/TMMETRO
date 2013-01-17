SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CUSTOMERSXUSERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CUSTOMERSXUSERS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[CUSTOMERSXUSERS] WHERE
		[ID] = @ID
GO
