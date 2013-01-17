SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'CONFIG' table.
CREATE PROCEDURE [dbo].[_CONFIG_Update]
	-- The rest of writeable parameters
	@CONFIGNAME nvarchar(50),
	@CONFIGVALUE nvarchar(max),
	-- Primary key parameters
	@CONFIGID int
AS
	UPDATE [dbo].[CONFIG] SET
		[CONFIGNAME] = @CONFIGNAME,
		[CONFIGVALUE] = @CONFIGVALUE
	WHERE
		[CONFIGID] = @CONFIGID
GO
