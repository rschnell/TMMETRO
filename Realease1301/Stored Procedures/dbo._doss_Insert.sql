SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'doss' table.
CREATE PROCEDURE [dbo].[_doss_Insert]
	@DosIp varchar(39),
	@DosDate datetime
AS
	INSERT INTO [dbo].[doss]
	(
		[dosIp],
		[dosDate]
	)
	VALUES
	(
		@DosIp,
		@DosDate
	)
	SELECT @@IDENTITY
GO
