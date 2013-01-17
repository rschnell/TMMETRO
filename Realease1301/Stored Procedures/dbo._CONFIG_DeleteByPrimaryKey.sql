SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CONFIG' table using the primary key value.
CREATE PROCEDURE [dbo].[_CONFIG_DeleteByPrimaryKey]
	@CONFIGID int
AS
	DELETE FROM [dbo].[CONFIG] WHERE
		[CONFIGID] = @CONFIGID
GO
