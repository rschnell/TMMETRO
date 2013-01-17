SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'POILOG' table.
CREATE PROCEDURE [dbo].[_POILOG_Update]
	-- The rest of writeable parameters
	@SUBID int,
	@USERID int,
	@LOGTYPE int,
	@POID int,
	@OLD nvarchar(max),
	@NEW nvarchar(max),
	@FIELD nvarchar(50),
	@TIMESTAMP datetime,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[POILOG] SET
		[SUBID] = @SUBID,
		[USERID] = @USERID,
		[LOGTYPE] = @LOGTYPE,
		[POID] = @POID,
		[OLD] = @OLD,
		[NEW] = @NEW,
		[FIELD] = @FIELD,
		[TIMESTAMP] = @TIMESTAMP
	WHERE
		[ID] = @ID
GO
