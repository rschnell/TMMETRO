SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'PERSONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_PERSONS_DeleteByPrimaryKey]
	@PERSONID int
AS
	DELETE FROM [dbo].[PERSONS] WHERE
		[PERSONID] = @PERSONID
GO
