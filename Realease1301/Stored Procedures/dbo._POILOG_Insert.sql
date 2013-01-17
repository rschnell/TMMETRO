SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'POILOG' table.
CREATE PROCEDURE [dbo].[_POILOG_Insert]
	@SUBID int,
	@USERID int,
	@LOGTYPE int,
	@POID int,
	@OLD nvarchar(max),
	@NEW nvarchar(max),
	@FIELD nvarchar(50),
	@TIMESTAMP datetime
AS
	INSERT INTO [dbo].[POILOG]
	(
		[SUBID],
		[USERID],
		[LOGTYPE],
		[POID],
		[OLD],
		[NEW],
		[FIELD],
		[TIMESTAMP]
	)
	VALUES
	(
		@SUBID,
		@USERID,
		@LOGTYPE,
		@POID,
		@OLD,
		@NEW,
		@FIELD,
		@TIMESTAMP
	)
	SELECT @@IDENTITY
GO
