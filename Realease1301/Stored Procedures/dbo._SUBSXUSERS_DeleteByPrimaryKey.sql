SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SUBSXUSERS' table using the primary key value.
CREATE PROCEDURE [dbo].[_SUBSXUSERS_DeleteByPrimaryKey]
	@SUBID int
AS
	DELETE FROM [dbo].[SUBSXUSERS] WHERE
		[SUBID] = @SUBID
GO
