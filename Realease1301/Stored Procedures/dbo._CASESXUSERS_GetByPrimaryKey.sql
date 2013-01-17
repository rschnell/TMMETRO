SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CASESXUSERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_CASESXUSERS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[CASESXUSERS] WHERE
		[ID] = @ID
GO
