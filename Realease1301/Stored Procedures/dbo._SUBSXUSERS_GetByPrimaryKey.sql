SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SUBSXUSERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_SUBSXUSERS_GetByPrimaryKey]
	@SUBID int
AS
	SELECT * FROM [dbo].[SUBSXUSERS] WHERE
		[SUBID] = @SUBID
GO
