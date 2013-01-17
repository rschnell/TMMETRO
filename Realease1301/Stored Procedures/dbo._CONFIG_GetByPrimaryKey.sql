SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CONFIG' table using the primary key value.
CREATE PROCEDURE [dbo].[_CONFIG_GetByPrimaryKey]
	@CONFIGID int
AS
	SELECT * FROM [dbo].[CONFIG] WHERE
		[CONFIGID] = @CONFIGID
GO
